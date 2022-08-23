import 'package:flutter/material.dart';
import 'package:esp_app/services/device.dart';
import 'package:esp_app/constants.dart';

class EventsList extends StatefulWidget {
  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Device;
    return Scaffold(
      backgroundColor: Color(colorPalette["secondary"]),
      appBar: AppBar(
        title: Text(args.deviceName)
      ),
      body: Container(
        child: FutureBuilder(
          future: ,
          builder: (context, snapshot) {

          }
        )
      )
    );
  }
}