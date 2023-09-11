import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/dialogs/no_connectivity_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider extends ChangeNotifier {
  String status = 'waiting...';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;

  Future<void> checkConnectivity() async {
    ConnectivityResult connectionResult =
        await _connectivity.checkConnectivity();
    if (connectionResult == ConnectivityResult.mobile) {
      status = "Connected to MobileData";
      notifyListeners();
    } else if (connectionResult == ConnectivityResult.wifi) {
      status = "Connected to Wifi";
      notifyListeners();
    } else {
      status = "Offline";
      notifyListeners();
    }
  }

  void checkRealtimeConnection(BuildContext context) {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      switch (event) {
        case ConnectivityResult.mobile:
          {
            status = "Connected to MobileData";
            notifyListeners();
          }
          break;
        case ConnectivityResult.wifi:
          {
            status = "Connected to Wifi";
            notifyListeners();
          }
          break;
        default:
          {
            status = 'Offline';
            showNoConnectivityDialog(context);
            notifyListeners();
          }
          break;
      }
    });
  }
}
