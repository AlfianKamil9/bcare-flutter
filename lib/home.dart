import 'package:bcare/Service/auth_service.dart';
import 'package:bcare/artikel.dart';
import 'package:bcare/menu.dart';
import 'package:bcare/model/artikel.dart';
import 'package:bcare/profile.dart';
import 'package:bcare/service/artikel_service.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HalamanUtamaPage extends StatefulWidget {
  const HalamanUtamaPage({super.key});

  @override
  State<HalamanUtamaPage> createState() => _HalamanUtamaPageState();
}

class _HalamanUtamaPageState extends State<HalamanUtamaPage> {
// PAGINATION
  List<Widget> pages = [HalamanUtamaPage(), BcareMenu(), Profile()];
  int currentIndex = 0;
  // GET ARTIKEL
  List<Artikel> listArtikel = [];
  bool isLoading = true;
  Map<String, dynamic> userData = {};

  void fetchUserData() async {
    final user = await Authentikasi.getUser();
    userData = user;
  }

  void fetchArticle() async {
    isLoading = false;
    final result = await ArtikelService.fetchArticles();
    listArtikel = result;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    fetchArticle();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
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
                                "${userData['name']}",
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
                                        child: isLoading == true
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                itemCount: listArtikel.length,
                                                itemBuilder: (context, index) {
                                                  final artikel =
                                                      listArtikel[index];
                                                  return Container(
                                                      child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                DetailArtikel(
                                                                  artikel.id
                                                                      .toString(),
                                                                )),
                                                      );
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Divider(
                                                          thickness:
                                                              1.0, // Line thickness
                                                          color: Colors
                                                              .grey, // Line color
                                                          indent:
                                                              20.0, // Indentation from the left edge
                                                          endIndent:
                                                              10.0, // Indentation from the right edge
                                                        ),
                                                        Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        7,
                                                                    vertical:
                                                                        5),
                                                            child: Container(
                                                              child: Text(
                                                                "${artikel.title}", //TITLE ARTIKEL
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                softWrap: true,
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            )),
                                                        Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        7,
                                                                    vertical:
                                                                        5),
                                                            child: Container(
                                                              child: Text(
                                                                "${artikel.subTitle}",
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                softWrap: true,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 2,
                                                              ),
                                                            )),
                                                        SizedBox(height: 10),
                                                      ],
                                                    ),
                                                  ));
                                                })),
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
