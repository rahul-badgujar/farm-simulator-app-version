import 'dart:async';
import 'package:farm_game_app_version/services/firebase/auth/auth-helper.dart';
import 'package:farm_game_app_version/ui/pages/login-page/login-page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final _splashDuration = Duration(seconds: 3);
  @override
  Widget build(BuildContext context) {
    // Load next screen.
    Timer(_splashDuration, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });

    return Scaffold(
      body: Container(),
    );
  }
}
