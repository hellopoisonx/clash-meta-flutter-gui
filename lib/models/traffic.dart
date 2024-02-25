import 'package:flutter/foundation.dart';

class Traffic extends ChangeNotifier {
  String down = "0";
  String up = "0";
  void updateTraffic(String up, String down) {
    this.up = up;
    this.down = down;
    notifyListeners();
  }
}
