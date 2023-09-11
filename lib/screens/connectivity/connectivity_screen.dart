import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/providers/connectivity_provider.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:ecommerce/widgets/connectivity_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ConnectivityScreen extends StatelessWidget {
  const ConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final connectivityProvider = Provider.of<ConnectivityProvider>(context);

    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: const ConnectivityWidget(),
      ),
    );
  }
}
