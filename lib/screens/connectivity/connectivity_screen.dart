import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/providers/connectivity_provider.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ConnectivityScreen extends StatefulWidget {
  const ConnectivityScreen({Key? key}) : super(key: key);

  @override
  State<ConnectivityScreen> createState() => _CheckInternetWidgetState();
}

class _CheckInternetWidgetState extends State<ConnectivityScreen> {
  ConnectivityProvider? _checkInternet;

  @override
  void initState() {
    _checkInternet = Provider.of<ConnectivityProvider>(context, listen: false);
    _checkInternet?.checkRealtimeConnection(context);
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
          width: screenWidth,
          height: screenHeight,
          color: provider.status == "Offline" ? Colors.red : Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(provider.status),
              ElevatedButton(
                onPressed: () {
                  context.router.pushNamed('/introduction_screen');
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        );
      }),
    );
  }
}
