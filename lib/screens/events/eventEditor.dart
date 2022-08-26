import 'package:flutter/material.dart';
import 'package:esp_app/services/device.dart';
import 'package:esp_app/services/deviceEvent.dart';
import 'package:esp_app/constants.dart';
import 'package:esp_app/screens/events/eventRepeatitions.dart';

class EventEditor extends StatefulWidget {
  final event = DeviceEvent.fromRepeat(List.filled(7, false));

  @override
  State<EventEditor> createState() => _EventEditorState();
}

class _EventEditorState extends State<EventEditor> {
  void updateRepetitions(List<bool> repeatitions) {
    setState(() => this.widget.event.repeat = repeatitions );
  }

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
              child: Center(child: Text((eventTime != null ? eventTime.hour.toString() : "12") + ":" + (eventTime == null ? "00" : eventTime.minute.toString()),
                style: TextStyle(color: Colors.white, fontSize: 40, letterSpacing: 2))),
              decoration: BoxDecoration(
              border: Border.all(color: Colors.white)
            ),),
            onTap: () async {
              eventTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(hour: eventTime == null ? 12 : eventTime.hour, minute: eventTime == null ? 0 : eventTime.minute),
                initialEntryMode: TimePickerEntryMode.dial,
              );
              setState(() {});
            },
          ),
          EventRepeatitions.withUpdateFunction(event: this.widget.event, preview: false, updateEventRepetitions: this.updateRepetitions),
        ])
      )
    );
  }
}