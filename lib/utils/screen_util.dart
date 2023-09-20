import 'package:flutter/material.dart' show BuildContext, MediaQuery;
import 'package:shared_preferences/shared_preferences.dart';

class ScreenUtil {
  ScreenUtil._sharedInstance();
  static final ScreenUtil _shared = ScreenUtil._sharedInstance();
  factory ScreenUtil.instance() => _shared;

  double? _screenWidth;
  double? _screenHeight;

  double get width => _screenWidth!;
  double get height => _screenHeight!;

  Future<void> initScreenUtils(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final savedWidth = prefs.getDouble('screenWidth');
    final savedHeight = prefs.getDouble('screenHeight');

    if (savedWidth != null && savedHeight != null) {
      _screenWidth = savedWidth;
      _screenHeight = savedHeight;

      print('savedWidth: $_screenWidth');
      print('savedHeight: $_screenHeight');
    } else {
      // ignore: use_build_context_synchronously
      final mediaQueryData = MediaQuery.of(context);
      _screenWidth = mediaQueryData.size.width;
      _screenHeight = mediaQueryData.size.height;
      await prefs.setDouble('screenWidth', _screenWidth!);
      await prefs.setDouble('screenHeight', _screenHeight!);
    }
  }
}
