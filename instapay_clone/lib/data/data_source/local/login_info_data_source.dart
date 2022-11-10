import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginInfoDataSource {
  final FlutterSecureStorage secureStorage;

  LoginInfoDataSource(this.secureStorage);

  Future<String> loadAccessToken() async {
    return await secureStorage.read(key: 'access_token') ?? '';
  }

  Future<void> saveAccessToken(String token) async {
    await secureStorage.write(key: 'access_token', value: token);
  }

  Future<void> deleteAccessToken() async {
    await secureStorage.delete(key: 'access_token');
  }

  Future<String> loadSalt() async {
    return await secureStorage.read(key: 'salt') ?? '';
  }

  Future<void> saveSalt(String salt) async {
    await secureStorage.write(key: 'salt', value: salt);
  }

  Future<void> deleteSalt() async {
    await secureStorage.delete(key: 'salt');
  }

  Future<String> loadEmail() async {
    return await secureStorage.read(key: 'email') ?? '';
  }

  Future<void> saveEmail(String email) async {
    await secureStorage.write(key: 'email', value: email);
  }

  Future<void> deleteEmail() async {
    await secureStorage.delete(key: 'email');
  }
}
