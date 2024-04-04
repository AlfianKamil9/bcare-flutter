import 'dart:io';

import 'package:bcare/Service/token_service.dart';
import 'package:bcare/model/questions.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PredictionService {
  static Future<List<Questions>> fetchQuestions() async {
    try {
      final token = await TokenManager.getToken();
      final response = await http.get(
          Uri.parse(
              'https://backend2-hwy6vx3s6a-et.a.run.app/api/v1/questions'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      final result = jsonDecode(response.body);
      final question = result['data'] as List<dynamic>;
      final questions = question.map((e) => Questions.fromJson(e)).toList();
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

  static Future<Map<String, dynamic>> submitKuisioner(
      String a1,
      String a2,
      String a3,
      String a4,
      String a5,
      String a6,
      String a7,
      String a8,
      String a9,
      String a10) async {
    try {
      final token = await TokenManager.getToken();
      final response = await http.post(
        Uri.parse(
            'https://backend2-hwy6vx3s6a-et.a.run.app/api/v1/submit-quiz'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'a1': a1,
          'a2': a2,
          'a3': a3,
          'a4': a4,
          'a5': a5,
          'a6': a6,
          'a7': a7,
          'a8': a8,
          'a9': a9,
          'a10': a10
        }),
      );
      final result = jsonDecode(response.body);
      return result;
    } catch (e) {
      throw Exception("Error, ${e.toString()}");
    }
  }

  static Future<Map<String, dynamic>> submitAndResult(File? file) async {
    try {
      final token = await TokenManager.getToken();
      final req = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://backend2-hwy6vx3s6a-et.a.run.app/api/v1/submit-image'));
      req.headers['Authorization'] = 'Bearer $token';
      final pic = await http.MultipartFile.fromPath('file', file!.path);
      req.files.add(pic);
      final response = await req.send();
      final res = await response.stream.bytesToString();
      //print('TOKEN : $token');
      final resDecode = jsonDecode(res);
      final pres = resDecode['data'];
      await TokenManager.saveLastCondition(
          pres['hasil'].toString(), pres['saran']['deskripsi'].toString());
      //print("RESPONSE : ${resDecode}");
      return resDecode;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
