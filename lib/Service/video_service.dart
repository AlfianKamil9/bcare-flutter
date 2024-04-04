import 'package:bcare/model/video.dart';
import 'package:bcare/Service/token_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VideoService {
  static Future<List<Videos>> fetchVideos() async {
    try {
      final token = await TokenManager.getToken();
      final response = await http.get(
          Uri.parse('https://backend2-hwy6vx3s6a-et.a.run.app/api/v1/video'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      final result = jsonDecode(response.body);
      final question = result['data'] as List<dynamic>;
      final questions = question.map((e) => Videos.fromJson(e)).toList();
      if (response.statusCode == 200) {
        //print("QUESTIONS : ${questions}");
        return questions;
      } else {
        print('ERROR :  ${result['message']}');
        throw Exception(result['message']);
      }
    } catch (e) {
      throw Exception("Error, ${e.toString()}");
    }
  }

  static Future<Map<String, dynamic>> fetchDetailVideo(String id) async {
    try {
      final token = await TokenManager.getToken();
      final response = await http.get(
          Uri.parse(
              'https://backend2-hwy6vx3s6a-et.a.run.app/api/v1/video/${id}'),
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
}
