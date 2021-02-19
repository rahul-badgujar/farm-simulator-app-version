import 'dart:async';

import 'package:farm_game_app_version/services/firebase/auth/auth-helper.dart';
import 'package:farm_game_app_version/ui/pages/info-page/info-page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final _splashDuration = Duration(seconds: 5);
  @override
  Widget build(BuildContext context) {
    // Load next screen.
    Timer(_splashDuration, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => InfoPage(),
        ),
      );
    });

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<User>(
              stream: AuthHelper().authStateChanges,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                final user = snapshot.data;
                if (user == null) {
                  return Text("Not logged in");
                } else {
                  return Text("Logged in as: ${user.email}");
                }
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await AuthHelper().signInWithGoogle();
              },
              child: Text("Login using Google"),
            ),
            ElevatedButton(
              onPressed: () async {
                await AuthHelper().signOut();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
