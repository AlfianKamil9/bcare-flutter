import 'dart:io';

import 'package:bcare/artikel/detailartikel.dart';
import 'package:bcare/home.dart';
import 'package:bcare/konseling/detailKonseling.dart';
import 'package:bcare/model/artikel.dart';
import 'package:bcare/model/konseling.dart';
import 'package:bcare/model/video.dart';
import 'package:bcare/vidio/detailvideo.dart';
import 'package:flutter/material.dart';

class HasilPrediksi extends StatefulWidget {
  final String hasil;
  final String deskripsi;
  final List<dynamic>? artikel_terkait;
  final List<dynamic>? vidio_terkait;
  final List<dynamic>? konseling_terkait;
  final File? gambar;

  const HasilPrediksi(this.hasil, this.deskripsi, this.artikel_terkait,
      this.vidio_terkait, this.konseling_terkait, this.gambar);

  @override
  State<HasilPrediksi> createState() => _HasilPrediksiState();
}

class _HasilPrediksiState extends State<HasilPrediksi> {
  List<Artikel> listArtikel = [];
  List<Videos> listVidio = [];
  List<Konselings> listKonseling = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    print(" ARTIKEL TERKAIT : ${widget.artikel_terkait}");
    listArtikel =
        widget.artikel_terkait!.map((e) => Artikel.fromJson(e)).toList();
    listVidio = widget.vidio_terkait!.map((e) => Videos.fromJson(e)).toList();
    listKonseling =
        widget.konseling_terkait!.map((e) => Konselings.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[400],
          leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HalamanUtamaPage()));
            },
            icon: Icon(Icons.arrow_back_ios_outlined),
          ),
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
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "${widget.hasil.toString()}",
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
                  child: Image.file(
                    widget.gambar!,
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
                  "${widget.deskripsi}",
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: listArtikel.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(
                                "ARTIKEL RELEVAN",
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
                              Container(
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(), // Disable nested scrolling
                                    shrinkWrap: true,
                                    itemCount: listArtikel.length,
                                    itemBuilder: (context, index) {
                                      final artik = listArtikel[index];
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailArtikel(artik.id
                                                          .toString())));
                                        },
                                        child: Card(
                                            child: Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${artik.title}",
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 7),
                                                Text(
                                                  "${artik.subTitle}",
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                )
                                              ]),
                                        )),
                                      );
                                    }),
                              ),
                            ])
                      : Container(),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: listVidio.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "VIDEO RELEVAN",
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
                            ListView.builder(
                                physics:
                                    const NeverScrollableScrollPhysics(), // Disable nested scrolling
                                shrinkWrap: true,
                                itemCount: listVidio.length,
                                itemBuilder: (context, index) {
                                  final vid = listVidio[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => DetailVideo(
                                                  vid.id.toString(),
                                                  vid.link_video.toString())));
                                    },
                                    child: Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Container(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 130,
                                                  height: 65,
                                                  child: Image.network(
                                                      "${vid.thumbnail_video}",
                                                      width: 150,
                                                      height: 75),
                                                ),
                                                SizedBox(width: 10),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${vid.title_video}",
                                                        softWrap: true,
                                                        textAlign:
                                                            TextAlign.justify,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14),
                                                      ),
                                                      SizedBox(height: 20),
                                                      Container(),
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ),
                                  );
                                })
                          ],
                        )
                      : Container(),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: listKonseling.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "VIDEO RELEVAN",
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
                            ListView.builder(
                                physics:
                                    const NeverScrollableScrollPhysics(), // Disable nested scrolling
                                shrinkWrap: true,
                                itemCount: listKonseling.length,
                                itemBuilder: (context, index) {
                                  final konsel = listKonseling[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailKonseling(
                                                      konsel.id.toString())));
                                    },
                                    child: Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Container(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${konsel.title_konseling}",
                                                        softWrap: true,
                                                        textAlign:
                                                            TextAlign.justify,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14),
                                                      ),
                                                      SizedBox(height: 20),
                                                      Container(),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 130,
                                                      height: 65,
                                                      child: Image.network(
                                                          "${konsel.image_konseling}",
                                                          width: 150,
                                                          height: 75),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  );
                                })
                          ],
                        )
                      : Container(),
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
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[300]),
                      )),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
