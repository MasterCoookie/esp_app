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

  bool open;
  Color buttonOpenColor;
  Color buttonCloseColor;

  bool acceptable;

  TimeOfDay eventTime;
  @override
  Widget build(BuildContext context) {
    if(this.open != null) {
      this.acceptable = true;
      if(this.open) {
        this.buttonOpenColor = Color(colorPalette["bcg"]);
        this.buttonCloseColor = Color(colorPalette["bcg_secondary"]);
      } else {
        this.buttonOpenColor = Color(colorPalette["bcg_secondary"]);
        this.buttonCloseColor = Color(colorPalette["bcg"]);
      }      
    } else {
        this.acceptable = false;
        this.buttonOpenColor = Color(colorPalette["bcg_secondary"]);
        this.buttonCloseColor = Color(colorPalette["bcg_secondary"]);
    }
    final args = ModalRoute.of(context).settings.arguments as Device;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.deviceName + " event")
      ),
      floatingActionButton: AnimatedSlide(
        offset: acceptable ? Offset.zero : Offset(0, 2),
        duration: Duration(milliseconds: 300),
        child: FloatingActionButton(
          child: Icon(Icons.check_circle),
          onPressed: () {
            this.widget.event.eventTimeFromTimeOfDay = eventTime;
          }
        ),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(onPressed: () {
                  setState(() => this.open = true);
                },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(this.buttonOpenColor)
                  ),
                  label: Text("Open"),
                  icon: Icon(Icons.keyboard_double_arrow_up),
                ),
                SizedBox(width:16),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() => this.open = false);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(this.buttonCloseColor)
                  ),
                  label: Text("Close"),
                  icon: Icon(Icons.keyboard_double_arrow_down),
                ),
              ]
            ),
          )
        ])
      )
    );
  }
}