import 'package:flutter/material.dart';
import 'package:esp_app/services/device.dart';
import 'package:esp_app/constants.dart';
import 'package:esp_app/services/bt.dart';


class DeviceWidget extends StatefulWidget {
  @override
  State<DeviceWidget> createState() => _DeviceWidgetState();

}

class _DeviceWidgetState extends State<DeviceWidget> {

  //tmp
  BT b = new BT("ESP32Test");
  
  void curtainMove(bool up, String MAC) async {
    if(up) {
      await b.scanAndConnect(MAC);
      print("moving up");
    } else {
      print("move down");
    }
  }
  void curtainStop() {
    print("stopped");
    b.stopScan();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Device;
    //print(args.deviceName);
    return Scaffold(
      backgroundColor: Color(colorPalette["secondary"]),
      body: Column(
        children: [Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 0, 10),
          child: Row(
            children: [Text(args.deviceName, style: TextStyle(color: Colors.white, fontSize: 26)),
            IconButton(color: Colors.white, icon: Icon(Icons.edit, color: Colors.white), onPressed: () {})]
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          child: IconButton(iconSize: 50, color: Colors.white, icon: Icon(Icons.arrow_upward_sharp, color: Colors.white), onPressed: () {}),
          onLongPressDown: (details) async {
            print(args.MAC);
            curtainMove(true, args.MAC);
          },
          onLongPressUp: () {
            curtainStop();
          },
          onLongPressCancel: () {
            curtainStop();
          }),
        GestureDetector(
          child: IconButton(iconSize: 50, color: Colors.white, icon: Icon(Icons.arrow_downward_sharp, color: Colors.white), onPressed: () {}),
          onLongPressDown: (details) {
            //curtainMove(false);
          },
          onLongPressUp: () {
            curtainStop();
          },
          onLongPressCancel: () {
            curtainStop();
          }),
          
        ],
      ),
    );
  }
}