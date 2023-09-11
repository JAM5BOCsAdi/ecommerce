import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/providers/connectivity_provider.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ConnectivityScreen extends StatelessWidget {
  const ConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final connectivityProvider = Provider.of<ConnectivityProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity'),
      ),
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              connectivityProvider.isConnected
                  ? 'Connected to the Internet'
                  : 'No Internet Connection',
            ),
            ElevatedButton(
              onPressed: () async {
                await connectivityProvider.checkConnectivity();
              },
              child: const Icon(Icons.refresh),
            ),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed('/introduction_screen');
              },
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
