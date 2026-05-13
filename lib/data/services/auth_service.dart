import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  static const _keyUsername = 'username';
  static const _keyIsLoggedIn = 'is_logged_in';

  late SharedPreferences _prefs;

  Future<AuthService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  bool get isLoggedIn => _prefs.getBool(_keyIsLoggedIn) ?? false;

  String get currentUsername => _prefs.getString(_keyUsername) ?? '';

  Future<void> login(String username) async {
    await _prefs.setBool(_keyIsLoggedIn, true);
    await _prefs.setString(_keyUsername, username);
  }

  Future<void> logout() async {
    await _prefs.setBool(_keyIsLoggedIn, false);
    await _prefs.remove(_keyUsername);
  }
}
