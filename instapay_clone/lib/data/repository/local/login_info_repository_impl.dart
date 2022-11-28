import 'package:instapay_clone/data/data_source/local/login_info_data_source.dart';
import 'package:instapay_clone/domain/repository/local/login_info_repository.dart';

class LoginInfoRepositoryImpl implements LoginInfoRepository {
  final LoginInfoDataSource _dataSource;

  LoginInfoRepositoryImpl(this._dataSource);

  @override
  Future<String> loadAccessToken() async {
    return await _dataSource.loadAccessToken();
  }

  @override
  Future<void> saveAccessToken(String token) async {
    await _dataSource.saveAccessToken(token);
  }

  @override
  Future<void> deleteAccessToken() async {
    await _dataSource.deleteAccessToken();
  }

  @override
  Future<String> loadSalt() async {
    return await _dataSource.loadSalt();
  }

  @override
  Future<void> saveSalt(String salt) async {
    await _dataSource.saveSalt(salt);
  }

  @override
  Future<void> deleteSalt() async {
    await _dataSource.deleteSalt();
  }
}
