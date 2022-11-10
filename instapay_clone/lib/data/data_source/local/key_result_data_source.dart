import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class KeyResultDataSource {
  final FlutterSecureStorage secureStorage;

  KeyResultDataSource(this.secureStorage);

  Future<String> loadUek() async {
    return await secureStorage.read(key: 'uek') ?? '';
  }

  Future<void> saveUek(String uek) async {
    await secureStorage.write(key: 'uek', value: uek);
  }

  Future<void> deleteUek() async {
    await secureStorage.delete(key: 'uek');
  }

  Future<String> loadSck() async {
    return await secureStorage.read(key: 'sck') ?? '';
  }

  Future<void> saveSck(String sck) async {
    await secureStorage.write(key: 'sck', value: sck);
  }

  Future<void> deleteSck() async {
    await secureStorage.delete(key: 'sck');
  }
}
