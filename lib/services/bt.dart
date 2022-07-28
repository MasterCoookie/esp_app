import 'package:quick_blue/quick_blue.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';
import 'package:esp_app/services/user.dart';

class BT {
  String name;
  String remoteServiceId = "eda3620e-0e6a-11ed-861d-0242ac120002";
  String remoteCharacteristicId = "f67783e2-0e6a-11ed-861d-0242ac120002";
  bool remoteServiceAvilable = false;
  String MAC;

  BT(String name, String MAC) {
    QuickBlue.setConnectionHandler(_handleConnectionChange);
    QuickBlue.setServiceHandler(_handleServiceDiscovery);
    this.name = name;
    this.MAC = MAC;
  }

  void _handleConnectionChange(String deviceId, BlueConnectionState state) {
    print('_handleConnectionChange $deviceId, $state');
    if(state.value == "connected") {
      QuickBlue.stopScan();
      QuickBlue.discoverServices(deviceId);
    }
  }

  void _handleServiceDiscovery(String deviceId, String serviceId) {
    print('_handleServiceDiscovery $deviceId, $serviceId');    
    if(serviceId == remoteServiceId) {
      print("$remoteServiceId service found!");
      remoteServiceAvilable = true;
      this.sendString("New connnection from ${User.email}");
    }
  }

  Future scanAndConnect() async {
    if (await Permission.bluetoothConnect.request().isGranted) {
    QuickBlue.scanResultStream.listen((result) {
      //print('onScanResult ${result.deviceId}, searching for $MAC');
      if(result.deviceId == this.MAC) {
        print("matching device found! Connecting...");
        QuickBlue.connect(result.deviceId);
      }
    });

    QuickBlue.startScan();
    await Future.doWhile(() => Future.delayed(Duration(milliseconds: 500)).then((_) => !this.remoteServiceAvilable));
    return true;
    }
  }

  void stopScan() {
    QuickBlue.stopScan();
  }

  void sendString(String str) {
    List<int> list = str.codeUnits;
    Uint8List bytes = Uint8List.fromList(list);
  
    QuickBlue.writeValue(this.MAC, this.remoteServiceId, this.remoteCharacteristicId, bytes, BleOutputProperty.withResponse);
  }
}