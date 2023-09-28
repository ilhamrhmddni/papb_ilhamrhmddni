import 'package:flutter/material.dart';
import 'package:wisatapahala/tabunganpage.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class LoginPage extends StatelessWidget {
  final int targetTabungan;
  final int selectedItemIndex;
  final Function(int, int) navigateToTabungan;
  final Function(bool)
      loginCallback; // Menggunakan callback untuk mengirim status login

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

    // Memeriksa apakah email dan password adalah admin
    if (email == 'admin' && password == 'admin') {
      // Memanggil fungsi loginCallback untuk mengubah status login menjadi true
      loginCallback(true);

      // Navigasi ke halaman beranda (HomePage)
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
      // Jika bukan admin, tampilkan pesan kesalahan
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
        backgroundColor:
            Color(0xFF0dad9c), // Mengubah warna AppBar menjadi hijau
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0), // Tambahkan margin di sini
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
              SizedBox(height: 20), // Tambahkan jarak vertikal
              ElevatedButton(
                onPressed: () {
                  _signIn(
                      context); // Memanggil _signIn dengan mengirimkan context
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary:
                      Color(0xFF0dad9c), // Mengubah warna button menjadi hijau
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
        selectedItemIndex: 0,
      ),
    );
  }
}
