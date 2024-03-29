abstract class LoginPackRepository {
  Future<String> loadPack();

  Future<void> savePack(String pack);

  Future<void> deletePack();
}
