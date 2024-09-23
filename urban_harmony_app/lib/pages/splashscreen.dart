// ignore_for_file: unused_import

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:urban_harmony_app/pages/homepage.dart';
import 'package:urban_harmony_app/pages/onboarding_screen.dart';
import 'package:urban_harmony_app/pages/signinpage.dart';
import 'package:urban_harmony_app/pages/signuppage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to SignupPage after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => OnBoardingScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/icons/SplashScreenAimated.gif',
      splashIconSize: 2000.0,
      animationDuration: Duration(milliseconds: 500),
      // duration: 50000,
      
      centered: true,
      nextScreen: HomePage(),
      backgroundColor: Colors.white
    );
  }
}