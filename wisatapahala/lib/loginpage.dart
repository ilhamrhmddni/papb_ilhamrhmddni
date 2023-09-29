import 'package:flutter/material.dart';
import 'package:wisatapahala/tabunganpage.dart';
import 'homepage.dart';

class LoginPage extends StatelessWidget {
  final int targetTabungan;
  final int selectedItemIndex;
  final Function(int, int) navigateToTabungan;
  final Function(bool) loginCallback;

  LoginPage({
    required this.navigateToTabungan,
    required this.loginCallback,
    required this.selectedItemIndex,
    required this.targetTabungan,
    required bool isLoggedIn,
  });

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;
    if (email == '1' && password == '1') {
      loginCallback(true);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Tabungan(
                    isLoggedIn: true,
                    selectedItemIndex: selectedItemIndex,
                    targetTabungan: targetTabungan,
                    navigateToTabungan: int,
                  )));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid email or password.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color(0xFF0dad9c),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _signIn(context);
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0dad9c),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: HomePage(
        isLoggedIn: true,
        loginCallback: (bool) {
          0;
        },
        navigateToTabungan: (selectedItemIndex, targetTabungan) {
          0;
        },
      ),
    );
  }
}
