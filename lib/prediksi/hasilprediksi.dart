import 'package:bcare/home.dart';
import 'package:flutter/material.dart';

class HasilPrediksi extends StatefulWidget {
  const HasilPrediksi({super.key});

  @override
  State<HasilPrediksi> createState() => _HasilPrediksiState();
}

class _HasilPrediksiState extends State<HasilPrediksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[400],
          leading: Container(),
          title: Padding(
            padding: const EdgeInsets.only(left: 65.0),
            child: Text(
              'Hasil Prediksi',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "KEMUNGKINAN DEPRESI",
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.pink[300]),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/profile-img.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "REKOMENDASI",
                softWrap: true,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blue[300]),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad ate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                softWrap: true,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: const Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 70),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => HalamanUtamaPage())));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.blue.shade300),
                        fixedSize: Size(200, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Kembali Ke Home",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue[300]),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
