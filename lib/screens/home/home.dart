import 'package:flutter/material.dart';
import 'package:esp_app/constants.dart';
import 'package:esp_app/services/user.dart';

class Home extends StatefulWidget {
  final User user;

  Home({this.user}) {
    user.getUserDevices();
  }

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
      body: Column(
          children: []
        )
    );
  }
}