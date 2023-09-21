import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LoadingIndicatorDialog {
  LoadingIndicatorDialog._sharedInstance();
  static final LoadingIndicatorDialog _shared =
      LoadingIndicatorDialog._sharedInstance();
  factory LoadingIndicatorDialog.instance() => _shared;

  late BuildContext _context;
  bool isDisplayed = false;

  LoadingIndicatorDialog._internal();

  show(BuildContext context, {String text = 'Loading...'}) {
    if (isDisplayed) {
      return;
    }
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          isDisplayed = true;
          return WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
              backgroundColor: Colors.white,
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                        child: CircularProgressIndicator(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(text),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  dismiss() {
    if (isDisplayed) {
      AutoRouter.of(_context).pop();
      // Navigator.of(_context).pop();
      isDisplayed = false;
    }
  }
}
