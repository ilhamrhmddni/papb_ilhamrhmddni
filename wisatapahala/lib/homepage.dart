import 'package:flutter/material.dart';
import 'package:wisatapahala/loginpage.dart';
import 'package:wisatapahala/tabunganpage.dart';

class HomePage extends StatefulWidget {
  final bool isLoggedIn; // Tambahkan parameter isLoggedIn

  HomePage(
      {required this.isLoggedIn,
      required Null Function(dynamic bool)
          loginCallback}); // Konstruktor dengan parameter
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedItemIndex = 0;
  int targetTabungan = 1000; // Properti untuk menyimpan target tabungan
  bool isLoggedIn = true; // Move isLoggedIn to the state of HomePage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0dad9c),
        title: Text(
          'Wisata Pahala',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.8,
        ),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          bool isSelected = index == selectedItemIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedItemIndex = index;

                // Mengatur target tabungan berdasarkan item yang dipilih
                if (selectedItemIndex == 0) {
                  targetTabungan = 1000; // Contoh target tabungan untuk item 0
                } else if (selectedItemIndex == 1) {
                  targetTabungan = 1500; // Contoh target tabungan untuk item 1
                }
                // Tambahkan pernyataan berdasarkan item lainnya
              });
            },
            child: Container(
              width: 150.0,
              height: 150.0,
              margin: EdgeInsets.all(5.2),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF0dad9c) : Colors.white,
                border: Border.all(
                  color: isSelected ? Color(0xFF0dad9c) : Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Text(
                  'Item $index',
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ElevatedButton(
          onPressed: () {
            if (selectedItemIndex != -1) {
              // Periksa status login sebelum navigasi
              if (widget.isLoggedIn) {
                // Menggunakan widget.isLoggedIn
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Tabungan(
                      isLoggedIn: true,
                      selectedItemIndex: 0,
                      targetTabungan: 0,
                    ),
                  ),
                );
              } else {
                // Jika isLoggedIn adalah false, navigasikan ke halaman Login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(
                      selectedItemIndex: 0,
                      targetTabungan: 0,
                      isLoggedIn: true,
                      loginCallback: (bool) {
                        0;
                      },
                    ), // Sesuaikan dengan nilai login yang benar
                  ),
                );
              }
            }
          },
          style: ElevatedButton.styleFrom(
            // ignore: deprecated_member_use
            primary: selectedItemIndex != -1
                ? Color(0xFF0dad9c) // Color when selectedItemIndex is not -1
                : Colors.grey, // Color when selectedItemIndex is -1 (disabled)
          ),
          child: Text(
            'Pilih',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
