import 'package:flutter_blue/flutter_blue.dart';
import 'package:permission_handler/permission_handler.dart';

class BT {
  String name;

  BT(name) {
    this.name = name;
  }

  Future scanAndConnect() async {
if (await Permission.bluetoothScan.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      print("BT Permission is granted");





    FlutterBlue flutterBlue = FlutterBlue.instance;
    // Start scanning
flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
var subscription = flutterBlue.scanResults.listen((results) {
    // do something with scan results
    print(results);
    for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
    }
});

// Stop scanning
flutterBlue.stopScan();
subscription.cancel();
return true;
}else{
    print("BT Permission is denied.");
}
  }
}