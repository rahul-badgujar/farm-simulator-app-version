import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info page"),
      ),
      body: Center(
        child: Image.asset("assets/img/farmer.png"),
      ),
    );
  }
}
