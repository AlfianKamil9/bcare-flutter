import 'package:bcare/prediksi/ambilphoto.dart';
import 'package:flutter/material.dart';

class Pertanyaan2 extends StatefulWidget {
  const Pertanyaan2({super.key});

  @override
  State<Pertanyaan2> createState() => _Pertanyaan2State();
}

class _Pertanyaan2State extends State<Pertanyaan2> {
  int _value = 0;
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
          ),
        ),
        backgroundColor: Color.fromARGB(255, 218, 218, 218),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Mohon isi sesuai dengan kondisi saat ini",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ),
              Divider(color: Colors.grey),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "1. Apakah anda sering merasa Bosan ?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    softWrap: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RadioListTile(
                    value: 1,
                    groupValue: _value,
                    activeColor: Colors.amberAccent,
                    onChanged: (val) {
                      setState(() {
                        _value = val!;
                      });
                    },
                    title: Text('Opsi 1'),
                  ),
                  RadioListTile(
                    value: 2,
                    groupValue: _value,
                    activeColor: Colors.amberAccent,
                    onChanged: (val) => setState(() {
                      _value = val!;
                    }),
                    title: Text('Opsi 2'),
                  ),
                  RadioListTile(
                    value: 3,
                    groupValue: _value,
                    activeColor: Colors.amberAccent,
                    onChanged: (val) {
                      setState(() {
                        _value = val!;
                      });
                    },
                    title: Text('Opsi 3'),
                  ),
                  RadioListTile(
                    value: 4,
                    groupValue: _value,
                    activeColor: Colors.amberAccent,
                    onChanged: (val) {
                      setState(() {
                        _value = val!;
                      });
                    },
                    title: Text('Opsi 4'),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AmbilFoto()));
                  },
                  child: Text('Selanjutnya'))
            ],
          ),
        ),
      ),
    );
  }
}
