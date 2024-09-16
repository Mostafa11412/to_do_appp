import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:to_do_appp/home/homeScreen.dart';

class SplashScreen extends StatelessWidget {
  static const String RouteName = "Splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      backgroundColor: Color(0xFFDFECDB),
      duration: Duration(seconds: 2),
      nextScreen: HomeScreen(),
      splashScreenBody: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 2,
          ),
          Image.asset("assets/images/logo.png"),
          Spacer(
            flex: 1,
          ),
          Image.asset("assets/images/Group 7.png"),
        ],
      )),
    );
  }
}
