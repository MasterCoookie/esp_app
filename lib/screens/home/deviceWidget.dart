import 'package:flutter/material.dart';
import 'package:esp_app/services/device.dart';

class DeviceWidget extends StatefulWidget {
  final Device device;

  const DeviceWidget({Key key, this.device}) : super(key: key);

  

  @override
  State<DeviceWidget> createState() => _DeviceWidgetState();
}

class _DeviceWidgetState extends State<DeviceWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.device.deviceName != null ? widget.device.deviceName : 'Unnamed Device');
  }
}