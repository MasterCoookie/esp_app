import 'package:quick_blue/quick_blue.dart';
import 'package:permission_handler/permission_handler.dart';

class BT {
  String name;

  BT(name) {
    this.name = name;
  }

  Future scanAndConnect() async {
    if (await Permission.bluetoothConnect.request().isGranted) {
    QuickBlue.scanResultStream.listen((result) {
      print('onScanResult ${result.name}');
    });

    QuickBlue.startScan();
    // ...
    //QuickBlue.stopScan();
    }
  }
}