import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage {
  AppSecureStorage._();
  late bool isLogged;
  static final instance = AppSecureStorage._();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  Future<void> saveCurrentUserData(
      {required String key, required String data}) async {
    await _storage.write(key: key, value: data);
  }

  Future<String?> getCurrentUserData({required String key}) async {
    return _storage.read(key: key);
  }

  void deleteUserData({required String key}) async {
    await _storage.delete(key: key);
  }
}
