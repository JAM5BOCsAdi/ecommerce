import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroProvider extends ChangeNotifier {
  bool? isFresher;

  late final SharedPreferences prefs;

  IntroProvider() {
    checkFresher();
    notifyListeners();
  }

  Future<void> checkFresher() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isFresher') ?? true) {
      isFresher = true;
      notifyListeners();
      print(isFresher);
    } else {
      isFresher = false;
      notifyListeners();
      print(isFresher);
    }
  }
}
