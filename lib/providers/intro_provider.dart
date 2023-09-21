import 'package:ecommerce/constants/constants.dart' show checkFresherError;
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroProvider extends ChangeNotifier {
  bool? isFresher;

  final logger = Logger();
  late final SharedPreferences prefs;

  IntroProvider() {
    checkFresher();
  }

  Future<void> checkFresher() async {
    try {
      prefs = await SharedPreferences.getInstance();
      if (prefs.getBool('isFresher') ?? true) {
        isFresher = true;
        notifyListeners();
      } else {
        isFresher = false;
        prefs.setBool('isFresher', false);
        notifyListeners();
      }
    } catch (e) {
      logger.d(checkFresherError, error: e.toString());
    }
  }
}
