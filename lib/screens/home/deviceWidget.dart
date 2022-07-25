import 'package:flutter/material.dart';
import 'package:esp_app/services/device.dart';

class DeviceWidget extends StatefulWidget {
  @override
  State<DeviceWidget> createState() => _DeviceWidgetState();
}

class _DeviceWidgetState extends State<DeviceWidget> {
  

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Device;
    return Text(args.deviceName);
  }
}