import 'package:flutter/material.dart';
import 'package:esp_app/constants.dart';

class DeviceConfig extends StatefulWidget {
  const DeviceConfig({Key key}) : super(key: key);

  @override
  State<DeviceConfig> createState() => _DeviceConfigState();
}

class _DeviceConfigState extends State<DeviceConfig> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(colorPalette["secondary"]),
      child: Text("configure")
    );
  }
}