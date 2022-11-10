import 'package:instapay_clone/domain/repository/local/login_info_repository.dart';

class LoginInfoUseCase {
  LoginInfoRepository repository;

  LoginInfoUseCase(this.repository);

  Future<String> loadAccessToken() async {
    return await repository.loadAccessToken();
  }

  Future<void> saveAccessToken(String token) async {
    await repository.saveAccessToken(token);
  }

  Future<void> deleteAccessToken() async {
    await repository.deleteAccessToken();
  }

  Future<String> loadSalt() async {
    return await repository.loadSalt();
  }

  Future<void> saveSalt(String salt) async {
    await repository.saveSalt(salt);
  }

  Future<void> deleteSalt() async {
    await repository.deleteSalt();
  }
}
