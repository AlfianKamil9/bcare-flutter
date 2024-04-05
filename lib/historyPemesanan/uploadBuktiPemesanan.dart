import 'dart:io';
import 'package:bcare/Service/pemesanan_service.dart';
import 'package:bcare/historyPemesanan/historyPesanan.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class UploadBuktiBayar extends StatefulWidget {
  final String reference_code;
  const UploadBuktiBayar(this.reference_code);

  @override
  State<UploadBuktiBayar> createState() => _UploadBuktiBayarState();
}

class _UploadBuktiBayarState extends State<UploadBuktiBayar> {
  File? image;
  File? images;
  String? imageFileName;

  Future<void> getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    imageFileName = imagePicked.name;
    setState(() {});
  }

  Future<void> _uploadImage() async {
    try {
      final res = await PemesananKonselingService.uploadBuktiTransfer(
          widget.reference_code.toString(), image!);
      if (res.statusCode == 200) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Upload Berhasil!'),
                  content: Text(
                      'Bukti transfer berhasil diunggah. Silahkan tunggu 1x24 jam untuk direview'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: ((context) => HistoryPesanan()))),
                      child: Text('OK'),
                    ),
                  ],
                ));
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    'Upload Gagal!',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                      'Bukti transfer gagal diunggah, Silahkan coba lagi nanti..'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ));
      }
      print("PRINT LAST : ${res}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        backgroundColor: Colors.blue[300],
        title: Center(
          child: Text(
            "Upload Bukti Bayar",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: <Widget>[
          GestureDetector(
            onTap: () async {
              await getImage();
            },
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                border: Border.all(width: 2, color: Colors.blue.shade100),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.archive_outlined,
                      size: 70,
                      color: Colors.blue[100],
                    ),
                    SizedBox(height: 15),
                    Text(
                      image != null
                          ? imageFileName!
                          : "Unggah Bukti Pembayaran",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue[300]),
                    ),
                  ],
                ),
              ),
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: _uploadImage,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: Size(200, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Text(
                "Kirim Bukti",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ))
        ]),
      ),
    );
  }
}
