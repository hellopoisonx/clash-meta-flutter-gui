import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:process_run/shell.dart';

class Kernel extends ChangeNotifier {
  final _shell = Shell();
  String _clashPath = "";
  bool _kernelIsRunning = false;
  get kernelStatus => _kernelIsRunning;
  set _kernelStatus(bool status) {
    _kernelIsRunning = status;
    notifyListeners();
  }

  void setup() {
    _clashPath = getClashPath();
    startClash();
  }

  String getClashPath() {
    String resolvedExecutablePath = Platform.resolvedExecutable;
    String rootPath = p.dirname(p.dirname(resolvedExecutablePath));
    final clashPath =
        p.join(rootPath, "bundle", "data", "flutter_assets", "assets");
    if (kDebugMode) {
      print(clashPath);
    }
    return clashPath;
  }

  void startClash() async {
    try {
      final cmd = [
        "/usr/bin/sh",
        p.join(_clashPath, "run.sh"),
        p.join(_clashPath, "clash.meta"),
        _clashPath
      ].join(" ");
      if (kDebugMode) {
        print(cmd);
      }
      _shell.run(cmd);
      _kernelStatus = true;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void stopClash() {
    try {
      final res = _shell.kill();
      if (res) {
        _kernelStatus = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
