import 'package:flutter/material.dart';
import 'package:bcare/Service/artikel_service.dart';

class DetailArtikel extends StatefulWidget {
  final String artikelId;

  const DetailArtikel(this.artikelId);

  @override
  State<DetailArtikel> createState() => _DetailArtikelState();
}

class _DetailArtikelState extends State<DetailArtikel> {
  late Future<Map<String, dynamic>> _futureDetailArticle;

  @override
  void initState() {
    super.initState();
    _futureDetailArticle = ArtikelService.fetchDetailArticle(widget.artikelId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, right: 70),
            child: Text(
              'Artikel',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: FutureBuilder<Map<String, dynamic>>(
              future: _futureDetailArticle,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error"),
                  );
                } else {
                  final detailArtikel = snapshot.data!;
                  return Column(
                    children: [
                      Text(
                        detailArtikel['title'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      // Ganti dengan widget untuk menampilkan gambar artikel
                      Image.network(detailArtikel['image']),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          detailArtikel['content'],
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
