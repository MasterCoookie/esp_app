import 'package:flutter/material.dart';
import 'package:esp_app/constants.dart';

class DeviceConfig extends StatefulWidget {
  const DeviceConfig({Key key}) : super(key: key);

  @override
  State<DeviceConfig> createState() => _DeviceConfigState();
}

class _DeviceConfigState extends State<DeviceConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(colorPalette["secondary"]),
      appBar: AppBar(
        title: Text("Configure your curtain", style: TextStyle(color: Colors.white)),
        actions: [IconButton(iconSize: 26, color: Colors.white, icon: Icon(Icons.check_circle, color: Colors.white), onPressed: () {})]
      ),
      body: IntrinsicWidth(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(iconSize: 26, color: Colors.white, icon: Icon(Icons.save_sharp, color: Colors.white), onPressed: () {}),
              GestureDetector(
                child: IconButton(iconSize: 50, color: Colors.white, icon: Icon(Icons.arrow_upward_sharp, color: Colors.white), onPressed: () {}),
                onLongPressDown: (details) {
          
                },
                onLongPressUp: () {
          
                },
                onLongPressCancel: () {
          
                }),
              GestureDetector(
                child: IconButton(iconSize: 50, color: Colors.white, icon: Icon(Icons.arrow_downward_sharp, color: Colors.white), onPressed: () {}),
                onLongPressDown: (details) {
          
                },
                onLongPressUp: () {
          
                },
                onLongPressCancel: () {
          
                }),
                IconButton(iconSize: 26, color: Colors.white, icon: Icon(Icons.save_sharp, color: Colors.white), onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}