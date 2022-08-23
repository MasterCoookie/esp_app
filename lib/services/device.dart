import 'package:esp_app/services/api_element.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:esp_app/services/user.dart';
import 'dart:convert';

class Device extends ApiElement {
  String deviceName;
  String MAC;
  int motorSpeed;
  String wifiName;
  String wifiPassword;
  int yPosClosed;
  User owner;

  Device(Map device) {
    this.deviceName = device["name"];
    this.MAC = device["MAC"];
    super.id = device["id"];
    this.wifiName = device["wifiName"] != null ? device["wifiName"] : "";
    this.wifiPassword = device["wifiPassword"] != null ? device["wifiPassword"] : "";
    this.motorSpeed = device["motorSpeed"] != null ? device["motorSpeed"] : 25;
    this.yPosClosed = device["YPosClosed"];
  }

  Future getDeviceEvents() async {
    Map<String, String> data = getAppendableAuth();
    data["deviceID"] = super.id;

    final url = ApiElement.api_address + "get_device_events";
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

      if(statusCode == 200) {
        return json.decode(response.body)["events"];
      }
      return false;
    } catch (e) {
      print("Error: " + e.message);
      return false;
    }
  }
}