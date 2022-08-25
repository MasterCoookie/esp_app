import 'package:flutter/material.dart';
import 'package:esp_app/services/device.dart';
import 'package:esp_app/services/deviceEvent.dart';
import 'package:esp_app/constants.dart';

class EventEditor extends StatefulWidget {

  @override
  State<EventEditor> createState() => _EventEditorState();
}

class _EventEditorState extends State<EventEditor> {
  TimeOfDay eventTime;
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
          ListTile(
            title: Container(
              margin: const EdgeInsets.all(32.0),
              padding: const EdgeInsets.all(6.0),
              child: Center(child: Text(eventTime.hour == null ? "12" : eventTime.hour.toString() + ":" + (eventTime.minute == null ? "00" : eventTime.minute.toString()),
                style: TextStyle(color: Colors.white, fontSize: 40, letterSpacing: 2))),
              decoration: BoxDecoration(
              border: Border.all(color: Colors.white)
            ),),
            onTap: () async {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(hour: eventTime.hour == null ? 12 : eventTime.hour, minute: eventTime.minute == null ? 0 : eventTime.minute),
                initialEntryMode: TimePickerEntryMode.dial,
              );
              setState(() {
                eventTime = time;
              });
            },
          )
        ])
      )
    );
  }
}