import 'package:quick_blue/quick_blue.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';
import 'package:esp_app/services/user.dart';

enum CharacteristicType {
  remote, setup
}

class BT {
  String name;
  String remoteServiceId = "eda3620e-0e6a-11ed-861d-0242ac120002";
  String remoteCharacteristicId = "f67783e2-0e6a-11ed-861d-0242ac120002";
  String setupCharacteristicId = "2250634e-8aa7-4e3e-b3a1-31d4bbe40127";
  bool remoteServiceAvilable = false;
  String MAC;

  BT(String name, String MAC) {
    QuickBlue.setConnectionHandler(_handleConnectionChange);
    QuickBlue.setServiceHandler(_handleServiceDiscovery);
    this.name = name;
    this.MAC = MAC;
  }

  void _handleConnectionChange(String deviceId, BlueConnectionState state) {
    print('_handleConnectionChange $deviceId, ${state.value}');
    if(state.value == "connected") {
      QuickBlue.stopScan();
      QuickBlue.discoverServices(deviceId);
    } else if(state.value == "disconnected") {
      print("Disconnected");
    }
  }

  void _handleServiceDiscovery(String deviceId, String serviceId) {
    print('_handleServiceDiscovery $deviceId, $serviceId');    
    if(serviceId == remoteServiceId) {
      print("$remoteServiceId service found!");
      remoteServiceAvilable = true;
      this.sendString("New connnection from ${User.email}", CharacteristicType.remote);
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

  void disconnect() {
    QuickBlue.stopScan();
    if(remoteServiceAvilable) {
      QuickBlue.disconnect(this.MAC);
      this.remoteServiceAvilable = false;
    }
  }

  Future sendString(String str, CharacteristicType type) async {
    List<int> list = str.codeUnits;
    Uint8List bytes = Uint8List.fromList(list);

    String characteristic;

    if(type == CharacteristicType.remote) {
      characteristic = this.remoteCharacteristicId;
    } else {
      characteristic = this.setupCharacteristicId;
    }

    try {
      if(this.remoteServiceAvilable) {
        this.remoteServiceAvilable = false;
        QuickBlue.writeValue(this.MAC, this.remoteServiceId, characteristic, bytes, BleOutputProperty.withoutResponse);
        //TODO: get response
        await Future.delayed(Duration(milliseconds: 100));
        this.remoteServiceAvilable = true;
      } else {
        await Future.doWhile(() async {
          await Future.delayed(Duration(milliseconds: 25));
          return !this.remoteServiceAvilable; 
        });
        this.remoteServiceAvilable = false;
        QuickBlue.writeValue(this.MAC, this.remoteServiceId, characteristic, bytes, BleOutputProperty.withoutResponse);
        await Future.delayed(Duration(milliseconds: 100));
        this.remoteServiceAvilable = true;
      }
    } catch(e) {
      print(e.message);
    }     
  }
}