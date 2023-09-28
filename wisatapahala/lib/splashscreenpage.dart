import 'package:flutter/material.dart';
import 'package:wisatapahala/homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a 2-second delay (or as needed)
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the main page after the delay
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(
            isLoggedIn: false,
            loginCallback: (bool) {
              0;
            },
            navigateToTabungan: (int selectedItemIndex, int targetTabungan) {
              0;
            },
            selectedItemIndex: 0,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF0dad9c), // Change to your desired background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'asset/icons/logoputih.png',
                width: 100,
                height: 100,
              ), // Display the splash screen image
              SizedBox(height: 20), // Space between logo and text
              Text(
                'Wisata Pahala',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
