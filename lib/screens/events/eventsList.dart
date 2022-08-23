import 'package:flutter/material.dart';
import 'package:esp_app/services/device.dart';

class EventsList extends StatefulWidget {
  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Device;
    Scaffold(
      appBar: AppBar(
        title: Text(args.deviceName)
      ),
    );
  }
}