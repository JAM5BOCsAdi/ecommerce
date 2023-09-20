import 'package:auto_route/auto_route.dart';
// import 'package:ecommerce/screens/loading/loading_screen.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _screen = ScreenUtil.instance();
    final _authService = context.read<AuthService>();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: _screen.height * 0.025,
            left: _screen.width * 0.075,
            right: _screen.width * 0.075,
          ),
          child: Container(
            color: Theme.of(context).colorScheme.onPrimary,
            width: _screen.width,
            height: _screen.height,
            child: Column(
              children: [
                Text('Home Screen'),
                ElevatedButton(
                    onPressed: () {
                      _authService.signOut();

                      // LoadingScreen.instance()
                      // .show(context: context, text: 'Loading...');

                      context.router.replaceNamed('/sign_in_screen');
                    },
                    child: Text('Sign Out')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
