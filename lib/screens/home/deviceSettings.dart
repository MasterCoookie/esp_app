import 'package:flutter/material.dart';
import 'package:esp_app/services/bt.dart';

class DeviceWidgetSettings extends StatefulWidget {
  final BT bt;
  DeviceWidgetSettings({ this.bt });

  @override
  State<DeviceWidgetSettings> createState() => _DeviceWidgetSettingsState();
}

class _DeviceWidgetSettingsState extends State<DeviceWidgetSettings> {
  final _formKey = GlobalKey<FormState>();

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(children: [
          
        ],)
      )
    );
  }
}