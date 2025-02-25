import 'package:flutter/material.dart';

class ModeProvider with ChangeNotifier {
  bool _lightModeEnable = true;
  // ignore: unnecessary_getters_setters
  bool get lightModeEnable => _lightModeEnable;

  set lightModeEnable(bool value) {
    _lightModeEnable = value;
  }

  chaneMode() {
    if (_lightModeEnable == true) {
      _lightModeEnable = false;

      notifyListeners();
    } else if (_lightModeEnable == false) {
      _lightModeEnable = true;
      notifyListeners();
    }
  }
}
