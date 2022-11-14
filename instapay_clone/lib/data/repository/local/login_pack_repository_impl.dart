import 'package:instapay_clone/data/data_source/local/local_db_data_source.dart';
import 'package:instapay_clone/domain/repository/local/login_pack_repository.dart';

class LoginPackRepositoryImpl implements LoginPackRepository {
  final LocalDbDataSource _dataSource;

  LoginPackRepositoryImpl(this._dataSource);

  @override
  Future<String> loadPack() async {
    return await _dataSource.loadData('pack');
  }

  @override
  Future<void> savePack(String pack) async {
    await _dataSource.saveData('pack', pack);
  }

  @override
  Future<void> deletePack() async {
    await _dataSource.deleteData('pack');
  }
}
