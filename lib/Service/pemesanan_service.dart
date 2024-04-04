import 'dart:io';

import 'package:bcare/model/pemesanan.dart';
import 'package:bcare/Service/token_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PemesananKonselingService {
  static Future<List<PemesananKonseling>> fetchPesananAll() async {
    try {
      final token = await TokenManager.getToken();
      final response = await http.get(
          Uri.parse(
              'https://backend2-hwy6vx3s6a-et.a.run.app/api/v1/order-konseling'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      final result = jsonDecode(response.body);
      final pesananan = result['data'] as List<dynamic>;
      final pesans =
          pesananan.map((e) => PemesananKonseling.fromJson(e)).toList();
      if (response.statusCode == 200) {
        //print("QUESTIONS : ${questions}");
        return pesans;
      } else {
        print('ERROR :  ${result['message']}');
        throw Exception(result['message']);
      }
    } catch (e) {
      throw Exception("Error, ${e.toString()}");
    }
  }

  static Future<Map<String, dynamic>> fetchDetailPesanan(
      String reference_code) async {
    try {
      final token = await TokenManager.getToken();
      final response = await http.get(
          Uri.parse(
              'https://backend2-hwy6vx3s6a-et.a.run.app/api/v1/order-konseling/${reference_code}'),
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

  static Future<http.StreamedResponse> uploadBuktiTransfer(
      String reference_code, File? file) async {
    try {
      final token = await TokenManager.getToken();
      //print("PERSIAPAN UPLOAD: ${file!}");
      final req = http.MultipartRequest(
          'PUT',
          Uri.parse(
              'https://backend2-hwy6vx3s6a-et.a.run.app/api/v1/order-konseling/upload-proof/${reference_code}'));
      req.headers['Authorization'] = 'Bearer $token';
      final pic = await http.MultipartFile.fromPath("file", file!.path);
      req.files.add(pic);
      var res = await req.send();
      print("RESPONSE : ${res}");
      return res;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
