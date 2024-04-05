import 'package:bcare/artikel/artikel.dart';
import 'package:bcare/infoKuisioner.dart';
import 'package:bcare/vidio/video.dart';
import 'package:flutter/material.dart';

import 'konseling/konseling.dart';

class BcareMenu extends StatefulWidget {
  @override
  State<BcareMenu> createState() => _BcareMenuState();
}

class _BcareMenuState extends State<BcareMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Image.asset(
          'assets/images/BCare.png',
          height: 20,
        )),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: ListView(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => KonselingPage()),
                    ),
                  },
                  child: Container(
                    width: 135,
                    height: 135,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Ubah sesuai dengan kebutuhan
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 255, 177, 201),
                              const Color.fromARGB(255, 255, 109, 154)
                            ], // Ganti warna sesuai dengan kebutuhan Anda
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.support_agent,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  size: 40,
                                ),
                                Text(
                                  'Konseling dengan Konselor',
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255)),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => InfoKuisioner()),
                    );
                  },
                  child: Container(
                    width: 135,
                    height: 135,
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 255, 177, 201),
                              const Color.fromARGB(255, 255, 109, 154)
                            ], // Ganti warna sesuai dengan kebutuhan Anda
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.health_and_safety_outlined,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Identifikasi dini Baby Blues',
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => VideoPage()),
                    ),
                  },
                  child: Container(
                    width: 135,
                    height: 135,
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 255, 177, 201),
                              const Color.fromARGB(255, 255, 109, 154)
                            ], // Ganti warna sesuai dengan kebutuhan Anda
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 7,
                                ),
                                Icon(
                                  Icons.video_collection_rounded,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  'Video',
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ArtikelPage()),
                    );
                  },
                  child: Container(
                    width: 135,
                    height: 135,
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 255, 177, 201),
                              const Color.fromARGB(255, 255, 109, 154)
                            ], // Ganti warna sesuai dengan kebutuhan Anda
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 7,
                                ),
                                Icon(
                                  Icons.article_rounded,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                SizedBox(height: 7),
                                Text(
                                  'Artikel',
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
