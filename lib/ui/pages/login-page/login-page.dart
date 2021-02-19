import 'package:farm_game_app_version/services/firebase/auth/auth-helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/background-1.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              StreamBuilder<User>(
                stream: AuthHelper().authStateChanges,
                builder: (context, snapshot) {
                  String txt = "No account";
                  final user = snapshot.data;
                  if (user != null) txt = user.email;
                  return Card(
                    child: Text(txt),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: GoogleAuthButton(
          loginCallback: () async {
            await AuthHelper().signInWithGoogle();
          },
          logoutCallback: () async {
            await AuthHelper().signOut();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      ),
    );
  }
}

class GoogleAuthButton extends StatelessWidget {
  final VoidCallback loginCallback;
  final VoidCallback logoutCallback;
  GoogleAuthButton({
    Key key,
    @required this.loginCallback,
    @required this.logoutCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: AuthHelper().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        final user = snapshot.data;
        return InkWell(
          onTap: user == null ? loginCallback : logoutCallback,
          child: Container(
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/wooden-button-long.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Text(
              user == null ? "Google Sign In" : "Sign Out",
              style: GoogleFonts.risque(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
