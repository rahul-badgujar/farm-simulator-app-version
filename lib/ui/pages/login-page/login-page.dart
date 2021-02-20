import 'package:farm_game_app_version/services/firebase/auth/auth-helper.dart';
import 'package:farm_game_app_version/ui/components/gui/ui-board.dart';

import 'package:farm_game_app_version/ui/components/gui/ui-text-button.dart';
import 'package:farm_game_app_version/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }

  Widget buildFAB() {
    return StreamBuilder<User>(
      stream: AuthHelper().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        final user = snapshot.data;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                24,
                0,
                0,
                8,
              ),
              child: UiBoard(
                type: UiBoardType.Parchment,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                    SizedBox(height: 2),
                    Text(
                      user == null ? "No Email" : user.email,
                    ),
                    SizedBox(height: 4),
                    UiTextButton(
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (user != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  0,
                  8,
                  8,
                ),
                child: UiTextButton(
                  scale: UiButtonScale.Big,
                  onClick: () {},
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text(
                      "Continue   >",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
