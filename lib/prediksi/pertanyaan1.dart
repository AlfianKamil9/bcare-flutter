import 'package:bcare/prediksi/errorPrediksi.dart';
import 'package:bcare/prediksi/pertanyaan2.dart';
import 'package:flutter/material.dart';

class Pertanyaan1 extends StatelessWidget {
  const Pertanyaan1({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pertanyaan1s(),
      routes: {
        '/yes': (context) => Pertanyaan2(),
        '/no': (context) => RejectPrediksi()
      },
    );
  }
}

class Pertanyaan1s extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Center(
            child: Image.asset(
          'assets/images/BCare.png',
          height: 20,
        )),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(30.0),
        child: ListView(
          children: [
            SizedBox(height: 30),
            Text("Pertanyaan Umum",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                softWrap: true,
                textAlign: TextAlign.center),
            SizedBox(
              height: 50,
            ),
            Text(
                "Apakah anda seorang Ibu yang baru melahirkan pada rentang waktu 5 - 14 hari pasca melahirkan ?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                softWrap: true,
                textAlign: TextAlign.center),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 60),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/no');
                        },
                        child: Text(
                          "Tidak",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )),
                    SizedBox(width: 20),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/yes');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 60),
                        ),
                        child: Text(
                          "Ya",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
