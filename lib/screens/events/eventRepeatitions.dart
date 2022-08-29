import 'package:flutter/material.dart';
import 'package:esp_app/services/deviceEvent.dart';
import 'package:esp_app/constants.dart';

class EventRepeatitions extends StatefulWidget {
  final DeviceEvent event;
  final bool preview;
  final Function updateEventRepetitions;

  EventRepeatitions({ this.event, this.preview, this.updateEventRepetitions });
  EventRepeatitions.withUpdateFunction({ this.event, this.preview, this.updateEventRepetitions });

  @override
  State<EventRepeatitions> createState() => _EventRepeatitionsState();
}

class _EventRepeatitionsState extends State<EventRepeatitions> {
  final weekdays = ["SU", "MO", "TU", "WE", "TH", "FR", "ST"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: this.widget.preview ? 20 : 42,
        child: ListView.builder(shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: widget.event.repeat.length, itemBuilder: (context, index) {
          TextStyle style;
          if(widget.event.repeat[index]) {
            style = TextStyle(fontWeight: FontWeight.bold, color: Colors.white, decoration: TextDecoration.underline, fontSize: this.widget.preview ? 18 : 28);
          } else {
            style = TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(113, 99, 87, 87), fontSize: this.widget.preview ? 18 : 28);
          }
          
          return InkWell(
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              child: Text(weekdays[index], style: style),
            ),
            onTap: () {
              if(!(this.widget.preview)) {
                this.widget.event.repeat[index] = !this.widget.event.repeat[index];
                this.widget.updateEventRepetitions(this.widget.event.repeat);
              }              
            },
          );
        }),
      )
  
      );
  }
}