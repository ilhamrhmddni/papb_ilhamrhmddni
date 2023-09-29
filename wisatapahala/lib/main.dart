import 'package:flutter/material.dart';
import 'package:wisatapahala/splashscreenpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WIsata Pahala',
      home: SplashScreen(),
    );
  }
}
