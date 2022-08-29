import 'package:flutter/material.dart';
import 'package:esp_app/constants.dart';
import 'package:esp_app/services/bt.dart';
import 'package:esp_app/services/device.dart';
import 'package:esp_app/services/args.dart';
import 'package:esp_app/services/curtain.dart';

class DeviceConfig extends StatefulWidget {

  DeviceConfig();
  final curtain = new Curtain();

  @override
  State<DeviceConfig> createState() => _DeviceConfigState();
}

class _DeviceConfigState extends State<DeviceConfig> {
  
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments;
    ConfigArgs args = arguments;
    BT bt = args.bt;
    Device device = args.device;

    return Scaffold(
      backgroundColor: Color(colorPalette["secondary"]),
      appBar: AppBar(
        backgroundColor: Color(colorPalette["primary"]),
        title: Text("Configure your curtain", style: TextStyle(color: Colors.white)),
        actions: [IconButton(iconSize: 26, color: Colors.white, icon: Icon(Icons.check_circle, color: Colors.white), onPressed: () { Navigator.pop(context); })]
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 25),
              child: Text("Use below arrows to adjust curtain position.\nThen, press the relevant save button, to save the position as either \"Open\" or \"Closed\" position.", style: TextStyle(color: Colors.white)),
            ),
            IconButton(iconSize: 26, color: Colors.white, icon: Icon(Icons.save_sharp, color: Colors.white), onPressed: () { widget.curtain.curtainClose(bt, CharacteristicType.setup); }),
            GestureDetector(
              child: IconButton(iconSize: 50, color: Colors.white, icon: Icon(Icons.arrow_upward_sharp, color: Colors.white), onPressed: () {}),
              onLongPressDown: (details) {
                  widget.curtain.curtainMove(false, bt, CharacteristicType.setup);
                },
                onLongPressUp: () {
                  widget.curtain.curtainStop(bt, CharacteristicType.setup);
                },
                onLongPressCancel: () {
                  widget.curtain.curtainStop(bt, CharacteristicType.setup);
                }),
            GestureDetector(
              child: IconButton(iconSize: 50, color: Colors.white, icon: Icon(Icons.arrow_downward_sharp, color: Colors.white), onPressed: () {}),
              onLongPressDown: (details) {
                  widget.curtain.curtainMove(true, bt, CharacteristicType.setup);
                },
                onLongPressUp: () {
                  widget.curtain.curtainStop(bt, CharacteristicType.setup);
                },
                onLongPressCancel: () {
                  widget.curtain.curtainStop(bt, CharacteristicType.setup);
                }),
              IconButton(iconSize: 26, color: Colors.white, icon: Icon(Icons.save_sharp, color: Colors.white), onPressed: () { widget.curtain.curtainOpen(bt, CharacteristicType.setup); })
          ],
        ),
      ),
    );
  }
}