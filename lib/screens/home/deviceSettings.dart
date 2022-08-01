import 'package:flutter/material.dart';
import 'package:esp_app/services/bt.dart';
import 'package:esp_app/constants.dart';
import 'package:esp_app/services/device.dart';

class DeviceWidgetSettings extends StatefulWidget {
  final BT bt;
  final Device device;

  DeviceWidgetSettings({ this.bt, this.device });

  @override
  State<DeviceWidgetSettings> createState() => _DeviceWidgetSettingsState();
}

class _DeviceWidgetSettingsState extends State<DeviceWidgetSettings> {
  final _formKey = GlobalKey<FormState>();
  String valueSpeed;
  String valueWifiName;
  String valueWifiPassword;
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(colorPalette["bcg_secondary"]),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            SizedBox(height: 18),
            Text("Device Settings", style: TextStyle(fontSize: 18)),
            SizedBox(height: 18),
            SizedBox(
              width: 200,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: textInputFieldDecoration.copyWith(hintText: "Motor speeed (rpm)"),
                onChanged: (val) { this.valueSpeed = val; }
              ),
            ), SizedBox(height: 12),
            TextFormField(
                decoration: textInputFieldDecoration.copyWith(hintText: "Wifi network name"),
                onChanged: (val) { this.valueWifiName = val; }
              ),
              TextFormField(
                obscureText: true,
                decoration: textInputFieldDecoration.copyWith(hintText: "Wifi network password"),
                onChanged: (val) { this.valueWifiPassword = val; }
              ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(colorPalette["alt_strong"]))),
              child: Text("Save", style: TextStyle(color: Colors.white)),
              onPressed: () {
                widget.bt.sendString(valueSpeed, CharacteristicType.setup);
                Navigator.pop(context);
              }
            )
          ],)
        )
      ),
    );
  }
}