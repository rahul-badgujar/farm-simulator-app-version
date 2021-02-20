import 'package:farm_game_app_version/services/firebase/auth/auth-helper.dart';
import 'package:farm_game_app_version/ui/pages/components/wooden-board.dart';
import 'package:farm_game_app_version/ui/pages/components/wooden-long-button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
              image: AssetImage("assets/img/background-1.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [],
          ),
        ),
        floatingActionButton: buildFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget buildFAB() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Spacer(),
          StreamBuilder<User>(
            stream: AuthHelper().authStateChanges,
            builder: (context, snapshot) {
              List boardChildrens = <Widget>[];
              if (snapshot.hasError) {
                boardChildrens.add(
                  Text("Error: ${snapshot.error}"),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                boardChildrens.add(
                  CircularProgressIndicator(),
                );
              }
              final user = snapshot.data;
              boardChildrens.addAll(<Widget>[
                CircleAvatar(
                  backgroundImage: user == null
                      ? null
                      : NetworkImage(
                          AuthHelper().currentUser.photoURL,
                        ),
                ),
                SizedBox(height: 4),
                Text(
                  user == null ? "Unknown" : "${user.displayName}",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  user == null ? "No Email" : user.email,
                ),
              ]);
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WoodenBoard(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: boardChildrens,
                    ),
                  ),
                  buildSignInSignOutButton(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildSignInSignOutButton() {
    return StreamBuilder<User>(
      stream: AuthHelper().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        final user = snapshot.data;
        return WoodenLongButton(
          onClick: () async {
            if (user == null) {
              await AuthHelper().signInWithGoogle();
            } else {
              await AuthHelper().signOut();
            }
          },
          child: Text(
            user == null ? "Google Sign in" : "Google Sign out",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
