import 'dart:io';

import 'package:bcare/prediksi/hasilprediksi.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AmbilFoto extends StatefulWidget {
  const AmbilFoto({super.key});

  @override
  State<AmbilFoto> createState() => _AmbilFotoState();
}

class _AmbilFotoState extends State<AmbilFoto> {
  File? image;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.camera);
    image = File(imagePicked!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[400],
          leading: Container(),
          title: Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: Text(
              'Ambil Foto',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Image.file(
                      image!,
                      fit: BoxFit.cover,
                    ))
                : Container(),
            SizedBox(height: 50),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: Size(200, 75),
                    side: BorderSide(
                      color: Colors.blue.shade300,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () async {
                  await getImage();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.blue[300],
                      weight: 40,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Buka Kamera",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue[300]),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade300,
                    fixedSize: Size(200, 75),
                    side: BorderSide(
                      color: Colors.blue.shade300,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HasilPrediksi()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.send_rounded,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      weight: 40,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Prediksi",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      textAlign: TextAlign.center,
                    )
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
