import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'app.dart';

Future<void> main() async {
  // ensure flutter widgets binding
  WidgetsFlutterBinding.ensureInitialized();

  // initialize firebase app
  await Firebase.initializeApp();

  // full screen
  SystemChrome.setEnabledSystemUIOverlays([]);

  // lock landspace mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  // run app
  runApp(FarmGameApp());
}
