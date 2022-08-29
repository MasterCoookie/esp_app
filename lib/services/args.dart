import 'package:esp_app/services/device.dart';
import 'package:esp_app/services/bt.dart';
import 'package:esp_app/services/deviceEvent.dart';

class ConfigArgs {
  final Device device;
  final BT bt;

  ConfigArgs(this.device, this.bt);
}

class EventEditorArgs {
  final Device device;
  final DeviceEvent event;

    EventEditorArgs(this.device, this.event);
}