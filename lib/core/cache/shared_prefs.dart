import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  AppSharedPreferences._();
  static final instance = AppSharedPreferences._();
  Future<void> saveThemeBool({required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('ISDARK', value);
  }

  Future<bool?> getThemeBool() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('ISDARK');
  }
}
