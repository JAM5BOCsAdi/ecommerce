import 'package:flutter/material.dart' show BuildContext, MediaQuery;

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
