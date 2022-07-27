import 'package:esp_app/services/api_element.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Device extends ApiElement {
  String deviceName;
  String MAC;

  Device(Map device) {
    this.deviceName = device["name"];
    this.MAC = device["MAC"];
    super.id = device["id"];
  }
}