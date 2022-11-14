import 'package:instapay_clone/domain/repository/local/login_pack_repository.dart';

class LoginPackUseCase {
  LoginPackRepository repository;

  LoginPackUseCase(this.repository);

  Future<String> loadPack() async {
    return await repository.loadPack();
  }

  Future<void> savePack(String pack) async {
    await repository.savePack(pack);
  }

  Future<void> deletePack() async {
    await repository.deletePack();
  }
}
