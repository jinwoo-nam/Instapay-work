abstract class LoginInfoRepository {
  Future<String> loadAccessToken();

  Future<void> saveAccessToken(String token);

  Future<void> deleteAccessToken();

  Future<String> loadSalt();

  Future<void> saveSalt(String salt);

  Future<void> deleteSalt();
}
