import 'package:flutter/material.dart';
import 'package:wisatapahala/loginpage.dart';
import 'package:wisatapahala/tabunganpage.dart';

class HomePage extends StatefulWidget {
  final bool isLoggedIn;
  final Function(int, int) navigateToTabungan;

  HomePage(
      {required this.isLoggedIn,
      required this.navigateToTabungan,
      required Null Function(dynamic bool) loginCallback});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedItemIndex = 0;
  int targetTabungan = 1000;
  bool isLoggedIn = true;

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
                if (selectedItemIndex == 0) {
                  targetTabungan = 1000;
                } else if (selectedItemIndex == 1) {
                  targetTabungan = 1500;
                }
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
              if (widget.isLoggedIn) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Tabungan(
                      targetTabungan: targetTabungan,
                      selectedItemIndex: selectedItemIndex,
                      isLoggedIn: true,
                      navigateToTabungan: int,
                    ),
                  ),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(
                      targetTabungan: targetTabungan,
                      selectedItemIndex: selectedItemIndex,
                      navigateToTabungan: (int selectedIndex, int target) {
                        0;
                      },
                      loginCallback: (bool) {
                        0;
                      },
                      isLoggedIn: true,
                    ),
                  ),
                );
              }
            }
          },
          style: ElevatedButton.styleFrom(
            // ignore: deprecated_member_use
            primary: selectedItemIndex != -1 ? Color(0xFF0dad9c) : Colors.grey,
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
