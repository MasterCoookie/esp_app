import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DeviceEvent {
  String _id;
  int eventTime;
  int targetYpos;
  bool repeatable;
  List<bool> repeat;
}