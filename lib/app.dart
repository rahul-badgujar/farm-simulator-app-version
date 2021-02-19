import 'package:farm_game_app_version/utils/constants.dart';
import 'package:flutter/material.dart';

import 'ui/pages/spalsh-page/splash-page.dart';

class FarmGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
    );
  }
}
