import 'package:flutter/material.dart' show BuildContext, MediaQuery;

// class ScreenUtil {
// static double getScreenWidth({required BuildContext context}) =>
//     MediaQuery.of(context).size.width;

// static double getScreenHeight({required BuildContext context}) =>
//     MediaQuery.of(context).size.height;

double? _screenWidth;
double? _screenHeight;

void initScreenUtils(BuildContext context) {
  if (_screenWidth == null || _screenHeight == null) {
    final mediaQueryData = MediaQuery.of(context);
    _screenWidth = mediaQueryData.size.width;
    _screenHeight = mediaQueryData.size.height;
  }
}

double get screenWidth => _screenWidth!;
double get screenHeight => _screenHeight!;
// }
