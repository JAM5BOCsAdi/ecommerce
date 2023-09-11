import 'package:ecommerce/dialogs/generic_dialog.dart';
import 'package:flutter/widgets.dart' show BuildContext;

Future<bool> showNoConnectivityDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'No Internet Connection',
    content: 'Connect to Mobile internet or Wi-Fi',
    optionsBuilder: () => {
      'Cancel': false,
      'Connect': true,
    },
  ).then((value) => value ?? false);
}
