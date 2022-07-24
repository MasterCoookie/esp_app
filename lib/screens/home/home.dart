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
            children = Column(children: [
              Text('loaded')
            ]);
          } else {
            children = Column(children: [
              Text('loading')
            ]);
          }
          return Center(child: children );
        }
      )
    );
  }
}