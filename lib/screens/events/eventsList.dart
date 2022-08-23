import 'package:flutter/material.dart';
import 'package:esp_app/services/device.dart';
import 'package:esp_app/services/deviceEvent.dart';
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
          future: args.getDeviceEvents(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              print(snapshot.data);
              return ListView.builder(itemCount: snapshot.data.length, itemBuilder: (context, index) {
                final event = snapshot.data[index];
                return ListTile(
                  title: event.
                );
              });
            } else {
              return Text("loading");
            }
          }
        )
      )
    );
  }
}