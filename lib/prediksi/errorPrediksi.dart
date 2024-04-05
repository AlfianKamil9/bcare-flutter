import 'package:bcare/menu.dart';
import 'package:flutter/material.dart';

class RejectPrediksi extends StatefulWidget {
  @override
  State<RejectPrediksi> createState() => _RejectPrediksiState();
}

class _RejectPrediksiState extends State<RejectPrediksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Padding(
            padding: EdgeInsets.all(100.0),
            child: Image.asset(
              'assets/images/BCare.png',
              height: 20,
            )),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(60),
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Maaf, Anda bukan kriteria untuk melakukan prediksi Baby Blues",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.pink[300]),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Icon(
                Icons.error_outline_rounded,
                size: 130,
                color: Colors.pink[300],
              ),
              SizedBox(height: 80),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(120, 69)),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => BcareMenu()));
                  },
                  child: Text(
                    "Kembali ke Halaman Utama",
                    style: TextStyle(color: Color.fromARGB(255, 176, 16, 128)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
