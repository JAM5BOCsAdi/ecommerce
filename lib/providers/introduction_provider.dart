import 'package:flutter/material.dart';

class IntroductionProvider extends ChangeNotifier {
  final int _currentPage = 0;

  int get currentPage => _currentPage;
}
