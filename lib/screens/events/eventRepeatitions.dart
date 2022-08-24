import 'package:flutter/material.dart';
import 'package:esp_app/services/deviceEvent.dart';
import 'package:esp_app/constants.dart';

class EventRepeatitions extends StatelessWidget {
  final DeviceEvent event;
  final weekdays = ["SU", "MO", "TU", "WE", "TH", "FR", "ST"];
  EventRepeatitions({ this.event });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 20,
        child: ListView.builder(shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: event.repeat.length, itemBuilder: (context, index) {
          TextStyle style;
          if(event.repeat[index]) {
            style = TextStyle();
          } else {
            style = TextStyle();
          }
          
          return Padding(
            padding: const EdgeInsets.all(1.5),
            child: Text(weekdays[index], style: style),
          );
        }),
      )
  
      );
  }
}