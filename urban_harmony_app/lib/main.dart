// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:urban_harmony_app/pages/bottomNavBar/blogspage.dart';
import 'package:urban_harmony_app/pages/bottomNavBar/designspage.dart';
import 'package:urban_harmony_app/pages/bottomNavBar/notificationpage.dart';
import 'package:urban_harmony_app/pages/bottomNavBar/profilepage.dart';
import 'package:urban_harmony_app/pages/homepage.dart';
import 'package:urban_harmony_app/pages/onboarding_screen.dart';
import 'package:urban_harmony_app/pages/signinpage.dart';
import 'package:urban_harmony_app/pages/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // "/":(context) => OnBoardingScreen(),
        "/":(context) => SplashScreen(),
        // "/":(context) => SigningPage(),
        "/homepage":(context) => HomePage(),
        "/designspage":(context) => DesignsPage(),
        "/blogspage":(context) => BlogsPage(),
        "/notificationpage":(context) => NotificationPage(),
        "/profilepage":(context) => ProfilePage(),
      },
    );
  }
}
