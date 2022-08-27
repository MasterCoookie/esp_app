import 'package:esp_app/services/api_element.dart';
import 'package:esp_app/services/device.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class DeviceEvent extends ApiElement {
  int eventTime;
  int targetYpos;
  bool repeatable;
  List<dynamic> repeat;

  DeviceEvent({
    this.eventTime,
    this.targetYpos,
    this.repeatable,
    this.repeat
  });

  DeviceEvent.fromRepeat(List<bool> repeat) {
    this.repeatable = true;
    this.repeat = repeat;
  }

  factory DeviceEvent.fromJSON(Map<String, dynamic> json) {
    final DeviceEvent event = DeviceEvent(
      eventTime: json["eventTime"],
      targetYpos: json["targetYpos"],
      repeatable: json["repeatable"],
      repeat: json["repeat"]
    );
    event.id = json["_id"];
    return event;
  }

  set eventTimeFromTimeOfDay(TimeOfDay time) {
    var currTime = DateTime.now();
    int nextDay = 0;
    if(time.hour < currTime.hour || (time.hour == currTime.hour && time.minute <= currTime.minute)) {
      ++nextDay;
    }
    this.eventTime = (new DateTime(currTime.year, currTime.month, currTime.day + nextDay, time.hour, time.minute).millisecondsSinceEpoch) ~/ 1000;
  }

  Map<String, dynamic> get map {
    return {
      "eventTime": this.eventTime,
      "targetYpos": this.targetYpos,
      "repeatable": this.repeatable,
      "repeat": this.repeat
    };
  }

  Future<bool> saveAsNew(Device device) async {
    Map<String, dynamic> data = getAppendableAuth();

    data["deviceID"] = device.id;
    data["eventTime"] = this.eventTime;
    data["targetYpos"] = this.targetYpos;
    data["repeatable"] = this.repeatable;
    data["repeat"] = this.repeat;

    final url = ApiElement.api_address + "create_event";
    final uri = Uri.parse(url);
    String jsonData = json.encode(data);

    try {
      Response response = await post(
        uri,
        headers: ApiElement.headers,
        body: jsonData,
        encoding: ApiElement.encoding
      );

      int statusCode = response.statusCode;

      if(statusCode == 201) {
        return true;
      }
      print(statusCode);
      return false;
    } catch (e) {
      print("Error: " + e.message);
      return false;
    }
  }
}