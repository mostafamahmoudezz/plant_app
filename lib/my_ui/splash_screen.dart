import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:plant_app/my_ui/auth_page.dart';
import 'package:plant_app/my_ui/signup_page.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AnimatedSplashScreen(
        splash: 'assets/pngegg.png',
        nextScreen: AuthPage(),
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Duration(seconds: 2),
    );
  }
}
