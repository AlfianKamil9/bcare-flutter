import 'package:bcare/Service/token_service.dart';
import 'package:bcare/model/konseling.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class KonselingService {
  static Future<List<Konselings>> fetchKonselings() async {
    try {
      final token = await TokenManager.getToken();
      final response = await http.get(
          Uri.parse(
              'https://backend2-hwy6vx3s6a-et.a.run.app/api/v1/konseling'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      final result = jsonDecode(response.body);
      final question = result['data'] as List<dynamic>;
      final questions = question.map((e) => Konselings.fromJson(e)).toList();
      if (response.statusCode == 200) {
        print("QUESTIONS : ${questions}");
        return questions;
      } else {
        print('ERROR :  ${result['message']}');
        throw Exception(result['message']);
      }
    } catch (e) {
      throw Exception("Error, ${e.toString()}");
    }
  }

  static Future<Map<String, dynamic>> fetchDetailKonseling(String id) async {
    try {
      final token = await TokenManager.getToken();
      final response = await http.get(
          Uri.parse(
              'https://backend2-hwy6vx3s6a-et.a.run.app/api/v1/konseling/${id}'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final detailKonseling = result['data'];
        return detailKonseling;
      } else {
        throw Exception("SERVER NYA LAGI ERROR 500");
      }
    } catch (e) {
      throw Exception("NDAK TERHUBUNG INTERNET:  ${e.toString()}");
    }
  }

  static Future<Map<String, dynamic>> submitOrderKonseling(
      String konselingId, String time, String date) async {
    try {
      final token = await TokenManager.getToken();
      final response = await http.post(
        Uri.parse(
            'https://backend2-hwy6vx3s6a-et.a.run.app/api/v1/order-konseling'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'konselingId': konselingId,
          'konseling_date': date,
          'konseling_time': time
        }),
      );
      final result = jsonDecode(response.body);
      return result;
    } catch (e) {
      throw Exception("Error, ${e.toString()}");
    }
  }
}
