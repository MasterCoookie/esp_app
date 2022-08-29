import 'package:flutter/material.dart';
import 'package:esp_app/screens/wrapper.dart';
import 'package:esp_app/screens/home/deviceWidget.dart';
import 'package:esp_app/screens/home/deviceConfig.dart';
import 'package:esp_app/services/HTTPOverrides.dart';
import 'package:esp_app/screens/events/eventsList.dart';
import 'package:esp_app/screens/events/eventEditor.dart';
import 'dart:io';

void main() {
  //DEBUG
  HttpOverrides.global = new DevHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/deviceWidget': (context) => DeviceWidget(),
        '/deviceConfig': (context) => DeviceConfig(),
        '/eventsList': (context) => EventsList(),
        '/eventEditor': (context) => EventEditor(),
        },
      title: 'Curtain',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Wrapper(),
    );
  }
}
