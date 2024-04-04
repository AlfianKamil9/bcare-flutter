import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const _keyToken = 'token';
  static const _nameSave = 'name';
  static const _emailSave = 'email';
  static const _hasilSave = 'hasil';
  static const _saranSave = 'saran';

  // SAVE TOKEN
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyToken, token);
  }

  // AMBIL TOKEN
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }

  // HAPUS TOKEN
  static Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyToken);
  }

  // Save Name
  static Future<void> saveDetailUser(String name, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameSave, name);
    await prefs.setString(_emailSave, email);
  }

  // SAVE LAST CONDITION
  static Future<void> saveLastCondition(String hasil, String saran) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_hasilSave, hasil);
    await prefs.setString(_saranSave, saran);
  }

  static Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }

  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  static Future<String?> getLastHasil() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('hasil');
  }

  static Future<String?> getLastSaran() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('saran');
  }
}
