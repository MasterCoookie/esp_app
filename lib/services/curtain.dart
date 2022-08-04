import 'package:esp_app/services/bt.dart';

class Curtain {
  void curtainMove(bool up, BT b, CharacteristicType type) async {
    if(up) {
      print("moving up");
      b.sendString("U", type);
    } else {
      print("move down");
      b.sendString("D", type);
    }
  }
  void curtainStop(BT b, CharacteristicType type) {
    print("stopped");
    b.sendString("S", type);
  }
  void curtainOpen(BT b, CharacteristicType type) {
    print("Opening");
    b.sendString("O", type);
  }
  void curtainClose(BT b, CharacteristicType type) {
      print("Closing");
      b.sendString("C", type);
    }
}