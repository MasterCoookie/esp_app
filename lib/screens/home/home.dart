import 'package:flutter/material.dart';
import 'package:esp_app/constants.dart';

class Home extends StatefulWidget {
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
      )
    );
  }
}