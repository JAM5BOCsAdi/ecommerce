import 'package:flutter/foundation.dart';

class LoadingProvider extends ChangeNotifier {
  bool _showLoading = true;

  bool get showLoading => _showLoading;

  Future<void> initLoading() async {
    await Future.delayed(const Duration(seconds: 3));
    _showLoading = false;
    notifyListeners();
  }
}
