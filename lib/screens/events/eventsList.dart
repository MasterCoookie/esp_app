import 'package:flutter/material.dart';
import 'package:esp_app/services/device.dart';
import 'package:esp_app/services/deviceEvent.dart';
import 'package:esp_app/constants.dart';
import 'package:intl/intl.dart';

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
                final event = DeviceEvent.fromJSON(snapshot.data[index]);
                final time = DateFormat("HH:mm").format(DateTime.fromMillisecondsSinceEpoch(event.eventTime * 1000));
                return ListTile(
                  title: Text(time.toString()),
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