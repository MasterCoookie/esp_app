import 'package:flutter/material.dart';
import 'package:esp_app/services/device.dart';
import 'package:esp_app/services/deviceEvent.dart';
import 'package:esp_app/constants.dart';
import 'package:intl/intl.dart';
import 'package:esp_app/screens/events/eventRepeatitions.dart';
import 'package:esp_app/services/args.dart';

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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/eventEditor', arguments: EventEditorArgs(args, null) ).then((_) => setState(() {}));
        }
      ),
      body: Container(
        child: FutureBuilder(
          future: args.getDeviceEvents(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              print(snapshot.data);
              if(snapshot.data.length > 0) {
                return ListView.builder(itemCount: snapshot.data.length, itemBuilder: (context, index) {
                  final event = DeviceEvent.fromJSON(snapshot.data[index]);
                  final time = DateFormat("HH:mm").format(DateTime.fromMillisecondsSinceEpoch(event.eventTime * 1000));
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: Color(colorPalette["bcg"]),
                      leading: Text(time.toString(), style: TextStyle(
                        color: Color(colorPalette["primary"]),
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,  
                      )),
                      title: EventRepeatitions(event: event, preview: true),
                      onTap: () {
                        Navigator.pushNamed(context, '/eventEditor', arguments: EventEditorArgs(args, event) ).then((_) => setState(() {}));
                      },
                      onLongPress: () async {
                        await event.delete();
                        setState(() {});
                      },
                      trailing: Icon(event.targetYpos == 0 ? Icons.keyboard_double_arrow_up : Icons.keyboard_double_arrow_down, color: Colors.white),
                    ),
                  );
                });
              } else {
                return Center(child: Text("No events yet, create new one!", style: TextStyle(color: Colors.white, fontSize: 24)));
              }
            } else {
              return Text("loading");
            }
          }
        )
      )
    );
  }
}