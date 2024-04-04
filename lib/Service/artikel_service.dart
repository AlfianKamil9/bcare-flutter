import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bcare/model/artikel.dart';

class ArtikelService {
  static Future<List<Artikel>> fetchArticles() async {
    final response = await http.get(
        Uri.parse('https://backend2-hwy6vx3s6a-et.a.run.app//api/v1/artikel'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final articles = result["data"] as List<dynamic>;
      final artikel = articles.map((e) => Artikel.fromJson(e)).toList();
      return artikel;
    } else {
      throw Exception("udah masuk try tiba tiba ....");
    }
  }

  static Future<Map<String, dynamic>> fetchDetailArticle(String id) async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://backend2-hwy6vx3s6a-et.a.run.app//api/v1/artikel/${id}'),
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
