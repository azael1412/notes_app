import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SlideshowBloc with ChangeNotifier {
  final SharedPreferences sharedPreferences;
  bool _show;

  SlideshowBloc({this.sharedPreferences}) {
    setup();
  }

  void setup() {
    bool value = sharedPreferences.getBool('isSlideshow') ?? false;
    this._show = value;
    // this._show = !value;
    // print("slide value defaul $value");
    if (show == false) {
      sharedPreferences.setBool('isSlideshow', true);
    }
    //  else {
    //   sharedPreferences.setBool('isSlideshow', false);
    // }
    notifyListeners();
  }

  bool get show => this._show;
}
