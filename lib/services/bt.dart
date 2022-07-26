import 'package:flutter_blue/flutter_blue.dart';

class BT {
  String name;

  BT(name) {
    this.name = name;
  }

  Future scanAndConnect() async {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    // Start scanning
flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
var subscription = flutterBlue.scanResults.listen((results) {
    // do something with scan results
    for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
    }
});

// Stop scanning
flutterBlue.stopScan();
return true;
  }
}