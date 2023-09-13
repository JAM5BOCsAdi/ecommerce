import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroProvider extends ChangeNotifier {
  bool? isFresher;
  bool? isLoading;

  late final SharedPreferences prefs;

  IntroProvider() {
    checkFresher();
    notifyListeners();
  }

  Future<void> checkFresher() async {
    isLoading = true;
    notifyListeners();
    prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isFresher') ?? true) {
      isFresher = true;
    } else {
      isFresher = false;
    }
    isLoading = false;
    notifyListeners();
  }
}
