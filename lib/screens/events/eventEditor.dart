import 'package:flutter/material.dart';
import 'package:esp_app/services/device.dart';
import 'package:esp_app/services/deviceEvent.dart';
import 'package:esp_app/constants.dart';
import 'package:esp_app/screens/events/eventRepeatitions.dart';
import 'package:esp_app/services/args.dart';

class EventEditor extends StatefulWidget {

  @override
  State<EventEditor> createState() => _EventEditorState();
}

class _EventEditorState extends State<EventEditor> {
  void updateRepetitions(List<bool> repeatitions) {
    setState(() => this.event.repeat = repeatitions );
  }

  bool open;
  Color buttonOpenColor;
  Color buttonCloseColor;

  bool acceptable;

  DeviceEvent event = DeviceEvent.fromRepeat(List.filled(7, false));

  TimeOfDay eventTime = new TimeOfDay(hour: 12, minute: 0);
  @override
  Widget build(BuildContext context) {
    EventEditorArgs arguments = ModalRoute.of(context).settings.arguments;
    Device device = arguments.device;
    this.event = arguments.event ?? event;

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
    return Scaffold(
      appBar: AppBar(
        title: Text(device.deviceName + " event")
      ),
      floatingActionButton: AnimatedSlide(
        offset: acceptable ? Offset.zero : Offset(0, 2),
        duration: Duration(milliseconds: 300),
        child: FloatingActionButton(
          child: Icon(Icons.check_circle),
          onPressed: () async {
            this.event.eventTimeFromTimeOfDay = eventTime;
            if(this.open) {
              this.event.targetYpos = 0;
            } else {
              this.event.targetYpos = device.yPosClosed;
            }
            if(await this.event.saveAsNew(device)) {
              Navigator.pop(context);
            } else {
              await toastTemplate('Error creating event :(');
            }
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
              child: Center(child: Text(( eventTime.hour < 10 ? ('0' + eventTime.hour.toString()) : eventTime.hour.toString()) + ":" + (eventTime.minute == 0 ? "00" : eventTime.minute.toString()),
                style: TextStyle(color: Colors.white, fontSize: 40, letterSpacing: 2))),
              decoration: BoxDecoration(
              border: Border.all(color: Colors.white)
            ),),
            onTap: () async {
              eventTime = await (showTimePicker(
                context: context,
                initialTime: TimeOfDay(hour: eventTime.hour, minute: eventTime.minute),
                initialEntryMode: TimePickerEntryMode.dial,
              )) ?? eventTime;
              setState(() {});
            },
          ),
          EventRepeatitions.withUpdateFunction(event: this.event, preview: false, updateEventRepetitions: this.updateRepetitions),
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