import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PinCodeDataSource {
  final FlutterSecureStorage secureStorage;

  PinCodeDataSource(this.secureStorage);

  Future<String> loadPinCode() async {
    return await secureStorage.read(key: 'pin_code') ?? '';
  }

  Future<void> savePinCode(String pinCode) async {
    await secureStorage.write(key: 'pin_code', value: pinCode);
  }

  Future<void> deletePinCode() async {
    await secureStorage.delete(key: 'pin_code');
  }
}
