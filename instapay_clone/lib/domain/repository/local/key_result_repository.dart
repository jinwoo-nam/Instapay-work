abstract class KeyResultRepository {
  Future<String> loadUek();

  Future<void> saveUek(String uek);

  Future<void> deleteUek();

  Future<String> loadSck();

  Future<void> saveSck(String sck);

  Future<void> deleteSck();
}
