import 'package:esp_app/services/api_element.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:esp_app/services/user.dart';

class Device extends ApiElement {
  String deviceName;
  String MAC;
  int motorSpeed;
  String wifiName;
  String wifiPassword;
  int yPosClosed;
  User owner;

  Device(Map device, User owner) {
    this.deviceName = device["name"];
    this.MAC = device["MAC"];
    super.id = device["id"];
    this.wifiName = device["wifiName"] != null ? device["wifiName"] : "";
    this.wifiPassword = device["wifiPassword"] != null ? device["wifiPassword"] : "";
    this.motorSpeed = device["motorSpeed"] != null ? device["motorSpeed"] : 25;
    this.yPosClosed = device["YPosClosed"];
  }
}