//import 'package:bcare/menu.dart';
import 'package:bcare/prediksi/pertanyaan1.dart';
import 'package:flutter/material.dart';

class InfoKuisioner extends StatefulWidget {
  @override
  State<InfoKuisioner> createState() => _InfoKuisionerState();
}

class _InfoKuisionerState extends State<InfoKuisioner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.of(context).pop(), // Example action for back button
        ),
        title: Center(
            child: Image.asset(
          'assets/images/BCare.png',
          height: 20,
        )),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: ListView(
          children: [
            Center(
                child: Text(
              'SELAMAT DATANG DI FITUR DETEKSI BABY BLUES',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              softWrap: true,
              textAlign: TextAlign.center,
            )),
            SizedBox(
              height: 50,
            ),
            Text(
              'Anda akan melakukan deteksi Baby Blues. Proses deteksi akan memakan waktu 5 - 10 menit. Pastikan anda membaca dengan seksama untuk medapatkan hasil yang sesuai.',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              softWrap: true,
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Adapun beberapa langkah yang harus dilakukan dalam identifikasi sebagai berikut:',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              softWrap: true,
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 30),
            Text(
              "Menjawab pertanyaan umum mengenai kondisi saat ini",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              softWrap: true,
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Mengisi pilihan kuisioner yang berjumlah 10 - 15 soal.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              softWrap: true,
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Melakukan foto keadan raut muka kondisi saat ini",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              softWrap: true,
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 60,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Pertanyaan1()));
              },
              child: Icon(Icons.navigate_next),
            )
          ],
        ),
      ),
    );
  }
}
