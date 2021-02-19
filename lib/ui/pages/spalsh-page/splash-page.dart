import 'package:farm_game_app_version/services/firebase/auth/auth-helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
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
