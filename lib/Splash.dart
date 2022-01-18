import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:splashscreen/splashscreen.dart';


class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: WelcomeScreen(),
      image: new Image.asset('assets/images/logo_verde.png'),
      backgroundColor: Colors.black,
      photoSize: 200.0,
      loaderColor: Colors.white,
    );
  }
}
