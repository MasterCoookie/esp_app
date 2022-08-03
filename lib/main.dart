import 'package:flutter/material.dart';
import 'package:esp_app/screens/wrapper.dart';
import 'package:esp_app/screens/home/deviceWidget.dart';
import 'package:esp_app/screens/home/deviceConfig.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/deviceWidget': (context) => DeviceWidget(),
        '/deviceConfig': (context) => DeviceConfig()
        },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Wrapper(),
    );
  }
}
