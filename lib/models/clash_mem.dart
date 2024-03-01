import 'package:flutter/material.dart';

class ClashMem extends ChangeNotifier {
  String _inuse = "";
  String _oslimit = "";
  Set get inuse => _inuse.split(" ").toSet();
  Set get oslimit => _oslimit.split(" ").toSet();
  set updateInuse(String n) {
    _inuse = n;
    notifyListeners();
  }

  set updateOslimit(String n) {
    _oslimit = n;
    notifyListeners();
  }

  void update(String inuse, String oslimit) {
    _inuse = inuse;
    _oslimit = oslimit;
    notifyListeners();
  }
}
