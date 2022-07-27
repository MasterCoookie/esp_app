import 'package:quick_blue/quick_blue.dart';
import 'package:permission_handler/permission_handler.dart';

class BT {
  String name;

  BT(name) {
    QuickBlue.setConnectionHandler(_handleConnectionChange);
    this.name = name;
  }

  void _handleConnectionChange(String deviceId, BlueConnectionState state) {
    print('_handleConnectionChange $deviceId, $state');
  }

  void _handleServiceDiscovery(String deviceId, String serviceId) {
    print('_handleServiceDiscovery $deviceId, $serviceId');
  }

  Future scanAndConnect(String MAC) async {
    if (await Permission.bluetoothConnect.request().isGranted) {
    QuickBlue.scanResultStream.listen((result) {
      //print('onScanResult ${result.deviceId}, searching for $MAC');
      if(result.deviceId == MAC) {
        print("matching device found! Connecting...");
        QuickBlue.connect(result.deviceId);
        QuickBlue.discoverServices(result.deviceId);
        QuickBlue.stopScan();
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