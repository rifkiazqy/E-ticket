import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const String userKey = 'USER_KEY';
  static const String tokenKey = 'TOKEN_KEY';
  static const String themeKey = 'THEME_KEY';
  
  final SharedPreferences prefs;

  PreferencesHelper({required this.prefs});

  // Menyimpan data user
  Future<bool> saveUser(String user) async {
    return await prefs.setString(userKey, user);
  }

  // Mengambil data user
  String? getUser() {
    return prefs.getString(userKey);
  }

  // Menyimpan token
  Future<bool> saveToken(String token) async {
    return await prefs.setString(tokenKey, token);
  }

  // Mengambil token
  String? getToken() {
    return prefs.getString(tokenKey);
  }

  // Menyimpan tema
  Future<bool> saveTheme(bool isDark) async {
    return await prefs.setBool(themeKey, isDark);
  }

  // Mengambil tema
  bool getTheme() {
    return prefs.getBool(themeKey) ?? false;
  }

  // Menghapus semua data (untuk logout)
  Future<bool> clearPreferences() async {
    return await prefs.clear();
  }
}