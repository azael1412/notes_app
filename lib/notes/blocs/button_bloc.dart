import 'package:flutter/material.dart';

class ButtonBloc with ChangeNotifier {
  bool _show = true;
  bool get show => this._show;
  set show(bool value) {
    this._show = value;
    notifyListeners();
  }
}
