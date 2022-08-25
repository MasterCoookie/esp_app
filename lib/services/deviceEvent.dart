import 'package:esp_app/services/api_element.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
}