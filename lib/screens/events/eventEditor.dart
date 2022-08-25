import 'package:flutter/material.dart';
import 'package:esp_app/services/device.dart';
import 'package:esp_app/services/deviceEvent.dart';
import 'package:esp_app/constants.dart';

class EventEditor extends StatefulWidget {

  @override
  State<EventEditor> createState() => _EventEditorState();
}

class _EventEditorState extends State<EventEditor> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Device;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.deviceName + " event")
      ),
      backgroundColor: Color(colorPalette["secondary"]),
      body: Container(
        child: Column(children: [
          SizedBox(height: 24),
          ListTile(
            title: Center(child: Text("12:00", style: TextStyle(color: Colors.white, fontSize: 38))),
            onTap: () async {
              final TimeOfDay newTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(hour: 12, minute: 0),
                initialEntryMode: TimePickerEntryMode.dial,
              );
            },
          )
        ])
      )
    );
  }
}