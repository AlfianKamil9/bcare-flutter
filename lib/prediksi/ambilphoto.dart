import 'dart:io';

import 'package:bcare/Service/prediction_service.dart';
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
    if (imagePicked != null) {
      setState(() {
        image = File(imagePicked.path);
      });
    }
  }

  Future<void> _submitImage() async {
    try {
      final res = await PredictionService.submitAndResult(image!);
      if (res['code'] == 201) {
        final result = res['data'];
        print("HASILNYA : ${result}");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: ((context) => HasilPrediksi(
                result['hasil'].toString(),
                result['saran']['deskripsi'].toString(),
                result['saran']['artikel_relevan'],
                result['saran']['vidio_relevan'],
                result['saran']['konseling_relevan'],
                image))));
      } else {
        _showErrorSnackbar(res['message']);
      }
    } catch (e) {
      _showErrorSnackbar(e.toString());
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    ));
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
          child: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      onPressed: _submitImage,
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => HasilPrediksi()));
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
                                color:
                                    const Color.fromARGB(255, 255, 255, 255)),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ))
                ],
              )),
        ],
      )),
    );
  }
}
