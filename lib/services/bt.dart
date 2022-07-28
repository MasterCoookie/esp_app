import 'package:quick_blue/quick_blue.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';

class BT {
  String name;

  BT(name) {
    QuickBlue.setConnectionHandler(_handleConnectionChange);
    QuickBlue.setServiceHandler(_handleServiceDiscovery);
    this.name = name;
  }

  void _handleConnectionChange(String deviceId, BlueConnectionState state) {
    print('_handleConnectionChange $deviceId, $state');
    if(state.value == "connected") {
      QuickBlue.discoverServices(deviceId);
    }
  }

  void _handleServiceDiscovery(String deviceId, String serviceId) {
    print('_handleServiceDiscovery $deviceId, $serviceId');    
    if(serviceId == "4fafc201-1fb5-459e-8fcc-c5c9c331914b") {
      print("4fafc201-1fb5-459e-8fcc-c5c9c331914b service found!");
      List<int> list = 'dupa'.codeUnits;
      Uint8List bytes = Uint8List.fromList(list);
    

      QuickBlue.writeValue(deviceId, "4fafc201-1fb5-459e-8fcc-c5c9c331914b", "beb5483e-36e1-4688-b7f5-ea07361b26a8", bytes, BleOutputProperty.withResponse);
      QuickBlue.stopScan();
    }
  }

  Future scanAndConnect(String MAC) async {
    if (await Permission.bluetoothConnect.request().isGranted) {
    QuickBlue.scanResultStream.listen((result) {
      //print('onScanResult ${result.deviceId}, searching for $MAC');
      if(result.deviceId == MAC) {
        print("matching device found! Connecting...");
        QuickBlue.connect(result.deviceId);
      }
    });

    QuickBlue.startScan();
    // ...
    //QuickBlue.stopScan();
    }
  }

  void stopScan() {
    QuickBlue.stopScan();
  }
}