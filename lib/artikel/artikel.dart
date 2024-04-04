import 'package:bcare/artikel/detailartikel.dart';
import 'package:bcare/model/artikel.dart';
import 'package:bcare/service/artikel_service.dart';
import 'package:flutter/material.dart';

class ArtikelPage extends StatefulWidget {
  const ArtikelPage({super.key});

  @override
  State<ArtikelPage> createState() => _ArtikelPageState();
}

class _ArtikelPageState extends State<ArtikelPage> {
  List<Artikel> listArtikel = [];
  bool isLoading = true;

  void getAllArtikel() async {
    final result = await ArtikelService.fetchArticles();
    listArtikel = result;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    getAllArtikel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[400],
          leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_outlined),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 60.0),
            child: Text(
              'Daftar Artikel',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: isLoading == true
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Memuat")
                  ],
                ))
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: listArtikel.length,
                  itemBuilder: (context, index) {
                    final artikel = listArtikel[index];
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DetailArtikel(artikel.id.toString())));
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${artikel.title}",
                                      softWrap: true,
                                      maxLines: 2,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      "${artikel.subTitle}",
                                      softWrap: true,
                                      maxLines: 2,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ]),
                            ),
                          ),
                        )
                      ],
                    );
                  })),
    );
  }
}
