import 'package:flutter/material.dart';
import 'package:esp_app/constants.dart';
import 'package:esp_app/services/user.dart';

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
      backgroundColor: Color(colorPalette["secondary"]),
      appBar: AppBar(
        backgroundColor: Color(colorPalette["primary"]),
        title: Text("Select your device"),
      ),
      body: FutureBuilder(
        future: widget.user.getUserDevices(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          Widget children;
          if(snapshot.hasData) {
            print(snapshot.data);
            List devices = snapshot.data;
            children = Column(children: [SizedBox(height:20),
              ListView.builder(shrinkWrap: true, itemCount: devices.length, itemBuilder: ((context, index) {
                return Card(
                  color: Color(colorPalette["bcg"]),
                  margin: EdgeInsets.fromLTRB(8, 6, 8, 1),
                  child: ListTile(
                    title: Text(devices[index]["name"], style: TextStyle(color: Colors.white)),
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