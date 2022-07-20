import 'package:esp_app/services/api_element.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DeviceEvent extends ApiElement {
  int eventTime;
  int targetYpos;
  bool repeatable;
  List<bool> repeat;
}