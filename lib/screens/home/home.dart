import 'package:flutter/material.dart';
import 'package:esp_app/constants.dart';
import 'package:esp_app/services/user.dart';
import 'package:esp_app/services/device.dart';

class Home extends StatefulWidget {
  final User user;

  Home({this.user});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select your device"),
      ),
      body: FutureBuilder(
        future: widget.user.getUserDevices(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          Widget children;
          if(snapshot.hasData) {            
            children = Column(children: [SizedBox(height:8),
              ListView.builder(shrinkWrap: true, itemCount: snapshot.data.length, itemBuilder: ((context, index) {
                dynamic device = snapshot.data[index];
                return Card(
                  color: Color(colorPalette["bcg"]),
                  margin: EdgeInsets.fromLTRB(8, 6, 8, 1),
                  child: ListTile(
                    title: Text(device["name"], style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pushNamed(context, '/deviceWidget', arguments: Device(device));
                    },
                  )
                );
              }))
            ]);
          } else {
            children = Column(children: [loading],
            mainAxisAlignment: MainAxisAlignment.center,);
          }
          return Center(child: children);
        }
      )
    );
  }
}