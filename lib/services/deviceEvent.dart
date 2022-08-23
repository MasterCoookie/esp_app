import 'package:esp_app/services/api_element.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DeviceEvent extends ApiElement {
  int eventTime;
  int targetYpos;
  bool repeatable;
  List<bool> repeat;

  DeviceEvent({
    this.eventTime,
    this.targetYpos,
    this.repeatable,
    this.repeat
  });

  factory DeviceEvent.fromJSON(Map<String, dynamic> json) {
    return DeviceEvent(
      eventTime: json["eventTime"],
      targetYpos: json["targetYpos"],
      repeatable: json["repeatable"],
      repeat: json["repeat"]
    );
  }
}