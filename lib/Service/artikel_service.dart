import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bcare/model/artikel.dart';

class ArtikelService {
  static Future<List<Artikel>> fetchArticles() async {
    try {
      final response = await http.get(
          Uri.parse('https://backend-hwy6vx3s6a-uc.a.run.app/api/v1/artikel'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        //print(result);
        final articles = result["data"] as List<dynamic>;
        //final artikel = List<Artikel>.from(
        // result["data"].map((artikel) => Artikel.fromJson(artikel)));
        final artikel = articles.map((e) => Artikel.fromJson(e)).toList();
        print("data artikel ${artikel}");
        return artikel;
      } else {
        throw Exception("udah masuk try tiba tiba ....");
      }
    } catch (e) {
      throw Exception("error kenape:  ${e.toString()}");
    }
  }

  static Future<Map<String, dynamic>> fetchDetailArticle(String id) async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://backend-hwy6vx3s6a-uc.a.run.app/api/v1/artikel/${id}'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final detailArtikel = result['data'];
        print('detail artikel ${detailArtikel}');
        return detailArtikel;
      } else {
        throw Exception("error kenape: ......");
      }
    } catch (e) {
      throw Exception("error kenape:  ${e.toString()}");
    }
  }
}
