// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:ecommerce/providers/connectivity_provider.dart';
// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ConnectivityScreen extends StatelessWidget {
  const ConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final connectivityProvider = Provider.of<ConnectivityProvider>(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Network Error")),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // connectivityProvider.connectivityResult.toString(),
                'Error',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
