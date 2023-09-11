import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class ConnectivityProvider extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  ConnectivityResult _connectivityResult = ConnectivityResult.none;

  ConnectivityResult get connectivityResult => _connectivityResult;

  ConnectivityProvider() {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionState);
  }

  Future<void> initConnectivity() async {
    try {
      _connectivityResult = await _connectivity.checkConnectivity();
      notifyListeners();
    } on PlatformException catch (e) {
      print("Error Occurred: ${e.toString()} ");
    }
  }

  void _updateConnectionState(ConnectivityResult result) {
    if (result != _connectivityResult) {
      _connectivityResult = result;
      notifyListeners();
    }
  }
}
