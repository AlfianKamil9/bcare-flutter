import 'dart:convert';
import 'package:bcare/Service/token_service.dart';
import 'package:http/http.dart' as http;

class Authentikasi {
  static Future<Map<String, dynamic>> register(String name, String email,
      String familyEmail, String password, String confPassword) async {
    try {
      final response = await http.post(
        Uri.parse('https://backend2-hwy6vx3s6a-et.a.run.app//api/v1/register'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'familyEmail': familyEmail,
          'password': password,
          'confPassword': confPassword
        }),
      );
      if (response.statusCode == 201) {
        print('Data berhasil ditambahkan : kode ${response.statusCode}');
        final result = jsonDecode(response.body);
        return result;
      } else {
        throw Exception('Gagal mendaftar: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception("Error : ${e.toString()}");
    }
  }

  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://backend2-hwy6vx3s6a-et.a.run.app//api/v1/login'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        // print('Data berhasil login : kode ${result})');
        // print('TOKEN : kode ${result["token"]})');
        return result;
      } else {
        print('gagal diproses');
        throw Exception('Gagal login: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception("Error : ${e.toString()}");
    }
  }

  // LOGOUT
  static Future<Map<String, dynamic>> logout() async {
    try {
      final token = await TokenManager.getToken();
      final response = await http.delete(
          Uri.parse("https://backend2-hwy6vx3s6a-et.a.run.app//api/v1/logout"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return result;
      } else {
        print('gagal diproses');
        return result;
      }
    } catch (e) {
      throw Exception("Error : ${e.toString()}");
    }
  }

  // GET USER
  static Future<Map<String, dynamic>> getUser() async {
    try {
      final token = await TokenManager.getToken();
      final response = await http.get(
          Uri.parse('https://backend2-hwy6vx3s6a-et.a.run.app//api/v1/user'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final detailUser = result['data'];
        // print('User Login : $detailUser');
        // print('TOKEN : $token');
        return detailUser;
      } else {
        throw Exception("Error : User Tidak Ditemukan");
      }
    } catch (e) {
      throw Exception("Error : ${e.toString()}");
    }
  }
}
