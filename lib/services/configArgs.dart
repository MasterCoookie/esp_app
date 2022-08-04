import 'package:esp_app/services/device.dart';
import 'package:esp_app/services/bt.dart';

class ConfigArgs {
  final Device device;
  final BT bt;

  ConfigArgs({ this.device, this.bt });
}