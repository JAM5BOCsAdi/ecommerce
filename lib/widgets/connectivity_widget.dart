import 'package:ecommerce/providers/connectivity_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConnectivityWidget extends StatefulWidget {
  const ConnectivityWidget({Key? key}) : super(key: key);

  @override
  State<ConnectivityWidget> createState() => _CheckInternetWidgetState();
}

class _CheckInternetWidgetState extends State<ConnectivityWidget> {
  ConnectivityProvider? _checkInternet;

  @override
  void initState() {
    _checkInternet = Provider.of<ConnectivityProvider>(context, listen: false);
    _checkInternet?.checkRealtimeConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Internet Connectivity"),
      ),
      body: Consumer<ConnectivityProvider>(builder: (context, provider, child) {
        return Container(
          width: double.maxFinite,
          height: 40,
          color: provider.status == "Offline" ? Colors.red : Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(provider.status)],
          ),
        );
      }),
    );
  }
}
