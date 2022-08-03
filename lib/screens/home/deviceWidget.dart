import 'package:flutter/material.dart';
import 'package:esp_app/services/device.dart';
import 'package:esp_app/constants.dart';
import 'package:esp_app/services/bt.dart';
import 'package:esp_app/screens/home/deviceSettings.dart';


class DeviceWidget extends StatefulWidget {
  @override
  State<DeviceWidget> createState() => _DeviceWidgetState();

}

class _DeviceWidgetState extends State<DeviceWidget> {

  //tmp

  
  void curtainMove(bool up, BT b) async {
    if(up) {
      print("moving up");
      b.sendString("U", CharacteristicType.remote);
    } else {
      print("move down");
      b.sendString("D", CharacteristicType.remote);
    }
  }
  void curtainStop(BT b) {
    print("stopped");
    b.sendString("S", CharacteristicType.remote);
  }
  void curtainOpen(BT b) {
    print("Opening");
    b.sendString("O", CharacteristicType.remote);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Device;
    BT bluetoothLE = new BT(args.deviceName, args.MAC);
    //print(args.deviceName);
    return Scaffold(
      backgroundColor: Color(colorPalette["secondary"]),
      body: Column(
        children: [Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 0, 10),
          child: Row(
            children: [Text(args.deviceName, style: TextStyle(color: Colors.white, fontSize: 26)),
            IconButton(color: Colors.white, icon: Icon(Icons.edit, color: Colors.white), onPressed: () {}),
            IconButton(color: Colors.white, icon: Icon(Icons.settings, color: Colors.white), onPressed: () {
              showModalBottomSheet(context: context, builder: (context) {
                return DeviceWidgetSettings(bt: bluetoothLE, device: args);
              });
            })],
          ),
        ),
        SizedBox(height: 20),
        FutureBuilder(
          future: bluetoothLE.scanAndConnect(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              bluetoothLE.stopScan();
            
            return Column(
              children: [
                IconButton(iconSize: 50, color: Colors.white, icon: Icon(Icons.keyboard_double_arrow_up, color: Colors.white), onPressed: () { curtainOpen(bluetoothLE); }),
                GestureDetector(
                  child: IconButton(iconSize: 50, color: Colors.white, icon: Icon(Icons.arrow_upward_sharp, color: Colors.white), onPressed: () {}),
                  onLongPressDown: (details) async {
                    curtainMove(true, bluetoothLE);
                  },
                  onLongPressUp: () {
                    curtainStop(bluetoothLE);
                  },
                  onLongPressCancel: () {
                    curtainStop(bluetoothLE);
                  }),
                GestureDetector(
                  child: IconButton(iconSize: 50, color: Colors.white, icon: Icon(Icons.arrow_downward_sharp, color: Colors.white), onPressed: () {}),
                  onLongPressDown: (details) {
                    curtainMove(false, bluetoothLE);
                  },
                  onLongPressUp: () {
                    curtainStop(bluetoothLE);
                  },
                  onLongPressCancel: () {
                    curtainStop(bluetoothLE);
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