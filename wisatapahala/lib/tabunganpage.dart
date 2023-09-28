import 'package:flutter/material.dart';

class Tabungan extends StatefulWidget {
  final bool isLoggedIn;
  final int selectedItemIndex;
  final int targetTabungan;

  Tabungan(
      {required this.selectedItemIndex,
      required this.targetTabungan,
      required this.isLoggedIn,
      required Type navigateToTabungan});

  @override
  _TabunganState createState() => _TabunganState();
}

class _TabunganState extends State<Tabungan> {
  int tabungan = 0; // Menyimpan jumlah tabungan
  TextEditingController inputController = TextEditingController();
  List<int> riwayatTabungan = []; // Menyimpan riwayat tabungan

  void tambahTabungan(int nilai) {
    setState(() {
      tabungan += nilai;
      riwayatTabungan.add(nilai);

      // Cek apakah target tercapai
      if (tabungan >= widget.targetTabungan) {
        // Tampilkan popup target tercapai
        _showTargetAchievedPopup();
      }
    });
  }

  void hapusTabungan(int index) {
    setState(() {
      int nilaiHapus = riwayatTabungan[index];
      tabungan -= nilaiHapus;
      riwayatTabungan.removeAt(index);
    });
  }

  // Fungsi untuk menampilkan popup target tercapai
  void _showTargetAchievedPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Target Tercapai!'),
          content: Text('Anda telah mencapai target tabungan Anda.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Item ${widget.selectedItemIndex}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Jumlah Tabungan: $tabungan',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Target Tabungan: ${widget.targetTabungan}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tambah Tabungan'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                int nilaiTambah = int.tryParse(inputController.text) ?? 0;
                if (nilaiTambah > 0) {
                  tambahTabungan(nilaiTambah);
                  inputController.clear();
                }
              },
              child: Text('Tambah Tabungan'),
            ),
            SizedBox(height: 20),
            Text(
              'Riwayat Tabungan:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: riwayatTabungan.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Rp. ${riwayatTabungan[index]}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        hapusTabungan(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
