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

  
  void curtainMove(bool up, BT b) async {
    if(up) {
      print("moving up");
      b.sendString("U");
    } else {
      print("move down");
      b.sendString("D");
    }
  }
  void curtainStop(BT b) {
    print("stopped");
    b.sendString("S");
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Device;
    BT bluetooth_le = new BT(args.deviceName, args.MAC);
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
        FutureBuilder(
          future: bluetooth_le.scanAndConnect(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              bluetooth_le.stopScan();
            
            return Column(
              children: [
                GestureDetector(
                  child: IconButton(iconSize: 50, color: Colors.white, icon: Icon(Icons.arrow_upward_sharp, color: Colors.white), onPressed: () {}),
                  onLongPressDown: (details) async {
                    curtainMove(true, bluetooth_le);
                  },
                  onLongPressUp: () {
                    curtainStop(bluetooth_le);
                  },
                  onLongPressCancel: () {
                    curtainStop(bluetooth_le);
                  }),
                GestureDetector(
                  child: IconButton(iconSize: 50, color: Colors.white, icon: Icon(Icons.arrow_downward_sharp, color: Colors.white), onPressed: () {}),
                  onLongPressDown: (details) {
                    curtainMove(false, bluetooth_le);
                  },
                  onLongPressUp: () {
                    curtainStop(bluetooth_le);
                  },
                  onLongPressCancel: () {
                    curtainStop(bluetooth_le);
                  }),
              ],
            );
            } else {
              return Text("Connecting");
            }
          }
        ),
          
        ],
      ),
    );
  }
}