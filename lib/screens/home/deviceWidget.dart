import 'package:flutter/material.dart';
import 'package:esp_app/services/device.dart';
import 'package:esp_app/constants.dart';
import 'package:esp_app/services/bt.dart';
import 'package:esp_app/screens/home/deviceSettings.dart';
import 'package:esp_app/services/configArgs.dart';
import 'package:esp_app/services/curtain.dart';


class DeviceWidget extends StatefulWidget {
  final curtain = new Curtain();

  @override
  State<DeviceWidget> createState() => _DeviceWidgetState();

}

class _DeviceWidgetState extends State<DeviceWidget> {  
  
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Device;
    BT bluetoothLE = new BT(args.deviceName, args.MAC);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.event),
        onPressed: () {
          
        }
      ),
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
            }),
            IconButton(color: Colors.white, icon: Icon(Icons.perm_data_setting, color: Colors.white), onPressed: () {
              Navigator.pushNamed(context, '/deviceConfig', arguments: ConfigArgs(args, bluetoothLE));
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
                IconButton(iconSize: 50, color: Colors.white, icon: Icon(Icons.keyboard_double_arrow_up, color: Colors.white), onPressed: () { widget.curtain.curtainClose(bluetoothLE, CharacteristicType.remote); }),
                GestureDetector(
                  child: IconButton(iconSize: 50, color: Colors.white, icon: Icon(Icons.arrow_upward_sharp, color: Colors.white), onPressed: () {}),
                  onLongPressDown: (details) async {
                    widget.curtain.curtainMove(false, bluetoothLE, CharacteristicType.remote);
                  },
                  onLongPressUp: () {
                    widget.curtain.curtainStop(bluetoothLE, CharacteristicType.remote);
                  },
                  onLongPressCancel: () {
                    widget.curtain.curtainStop(bluetoothLE, CharacteristicType.remote);
                  }),
                GestureDetector(
                  child: IconButton(iconSize: 50, color: Colors.white, icon: Icon(Icons.arrow_downward_sharp, color: Colors.white), onPressed: () {}),
                  onLongPressDown: (details) {
                    widget.curtain.curtainMove(true, bluetoothLE, CharacteristicType.remote);
                  },
                  onLongPressUp: () {
                    widget.curtain.curtainStop(bluetoothLE, CharacteristicType.remote);
                  },
                  onLongPressCancel: () {
                    widget.curtain.curtainStop(bluetoothLE, CharacteristicType.remote);
                  }),
                  IconButton(iconSize: 50, color: Colors.white, icon: Icon(Icons.keyboard_double_arrow_down, color: Colors.white), onPressed: () { widget.curtain.curtainOpen(bluetoothLE, CharacteristicType.remote); }),
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