import 'package:flutter/material.dart';

class TentangKami extends StatelessWidget {
  const TentangKami({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Tentang Kami",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  'assets/images/BCare.png',
                  height: 50,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "BCARE adalah aplikasi identifikasi baby blues dengan memanfaatkan teknologi machine learning dalam memberikan prediksi dan rekomendasi tindakan kepada seorang ibu pasca melahirkan.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
