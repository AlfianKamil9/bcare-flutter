import 'package:bcare/menu.dart';
import 'package:bcare/profile.dart';

import 'artikel.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HalamanUtamaPage extends StatelessWidget {
  const HalamanUtamaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HalamanUtama(),
      routes: {'/artikel': (context) => DetailArtikel()},
    );
  }
}

class HalamanUtama extends StatefulWidget {
  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  List<Widget> pages = [HalamanUtamaPage(), BcareMenu(), Profile()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //   Membuat TAMPIL
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Container(
          color: Color.fromARGB(255, 246, 248, 249),
          child: ListView(children: [
            Container(
              padding: EdgeInsets.all(30.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Halo',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Siti Nurbaya',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 33, 35, 37),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Bagaimana harimu? Sehat selalu',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 33, 35, 37),
                                ),
                              ),
                            ],
                          ),
                          // Spacer(flex: 1),
                          Container(
                            child: Image.asset(
                              'assets/images/profile.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Card(
                        child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/heart-icon.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Kondisi Anda",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 7),
                                  child: Text(
                                    "Depresi Ringan",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 67, 67, 67),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )),
                    // CARD REKOMENDASI
                    SizedBox(height: 30),
                    Card(
                        child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/images/recom-icon.png',
                                      width: 50,
                                      height: 40,
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      "Rekomendasi",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 5),
                                    child: Container(
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "Akhir - akhir ini anda belum mencapai target harian langkah rekomendasi ",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                        TextSpan(
                                            text: "Olahraga Jogging ",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w600)),
                                        TextSpan(
                                            text:
                                                "untuk memaksimalkan kesehatan Anda",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                      ])),
                                    )),
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 6,
                              height: 100,
                              child: FittedBox(
                                child: Image.asset(
                                  'assets/images/women-run.png',
                                  width: 3,
                                  height: 3,
                                ),
                                fit: BoxFit.fitHeight,
                              )),
                        ],
                      ),
                    )),
                    // CARD Artikel
                    SizedBox(height: 30),
                    Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/images/recom-icon.png',
                                          width: 50,
                                          height: 40,
                                        ),
                                        SizedBox(width: 7),
                                        Text(
                                          "Artikel",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                          ),
                                        )
                                      ],
                                    ),
                                    // ARTIKEL 1
                                    Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        DetailArtikel()),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Divider(
                                              thickness: 1.0, // Line thickness
                                              color: Colors.grey, // Line color
                                              indent:
                                                  20.0, // Indentation from the left edge
                                              endIndent:
                                                  10.0, // Indentation from the right edge
                                            ),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 7, vertical: 5),
                                                child: Container(
                                                  child: Text(
                                                    "6 Tips Jitu Mencegah Baby Blues Setelah Melahirkan",
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                    softWrap: true,
                                                  ),
                                                )),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 7, vertical: 5),
                                                child: Container(
                                                  child: Text(
                                                    "Lahirnya sang buah hati ke dunia merupakan peristiwa yang mengundang berjuta emosi. Setelah menjalani masa-masa kehamilan ",
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    ),
                                                    softWrap: true,
                                                  ),
                                                )),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ])),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Color(0xFFC5C5C5),
        color: Color.fromARGB(255, 211, 80, 124),
        activeColor: Colors.pink[300],
        initialActiveIndex: 1,
        height: 60,
        items: [
          TabItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
              size: 32,
            ),
          ),
          TabItem(
              icon: Icon(
            Icons.health_and_safety_sharp,
            color: Colors.white,
            size: 40,
          )),
          TabItem(
              icon: Icon(
            Icons.library_books,
            color: Colors.black,
            size: 32,
          )),
        ],
        onTap: (int i) {
          setState(() => currentIndex = i);
          Navigator.push(
              context, MaterialPageRoute(builder: (i) => pages[currentIndex]));
        },
      ),
    );
  }
}
