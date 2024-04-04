import 'package:bcare/artikel/artikel.dart';
import 'package:bcare/home.dart';
import 'package:bcare/infoKuisioner.dart';
import 'package:bcare/vidio/video.dart';
import 'package:flutter/material.dart';

import 'konseling/konseling.dart';

class BcareMenu extends StatelessWidget {
  const BcareMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BcareMenus(),
      routes: {'/home': (context) => HalamanUtamaPage()},
    );
  }
}

class BcareMenus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HalamanUtamaPage()));
            },
            icon: Icon(Icons.arrow_back_ios_rounded)),
        title: Padding(
            padding: EdgeInsets.only(left: 100.0),
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
                    width: 150,
                    height: 150,
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
                              children: [
                                Icon(
                                  Icons.support_agent,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  size: 60,
                                ),
                                Text(
                                  'Konseling dengan Konselor',
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 14,
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
                    width: 150,
                    height: 150,
                    child: Card(
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.health_and_safety_outlined,
                                color: Colors.pink[400],
                                size: 60,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Identifikasi dini Baby Blues',
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink[400]),
                              ),
                            ],
                          )),
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
                    width: 150,
                    height: 150,
                    child: Card(
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 7,
                              ),
                              Icon(
                                Icons.video_collection_rounded,
                                color: const Color.fromARGB(255, 167, 66, 245),
                                size: 60,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Video',
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 167, 66, 245)),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )),
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
                    width: 150,
                    height: 150,
                    child: Card(
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 7,
                              ),
                              Icon(
                                Icons.article_rounded,
                                color: Color.fromARGB(255, 243, 174, 24),
                                size: 60,
                              ),
                              SizedBox(height: 7),
                              Text(
                                'Artikel',
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 243, 174, 24)),
                              ),
                            ],
                          )),
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
