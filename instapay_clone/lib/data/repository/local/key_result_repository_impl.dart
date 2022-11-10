import 'package:instapay_clone/data/data_source/local/key_result_data_source.dart';
import 'package:instapay_clone/domain/repository/local/key_result_repository.dart';

class KeyResultRepositoryImpl implements KeyResultRepository {
  final KeyResultDataSource _dataSource;

  KeyResultRepositoryImpl(this._dataSource);

  @override
  Future<String> loadUek() async {
    return await _dataSource.loadUek();
  }

  @override
  Future<void> saveUek(String uek) async {
    await _dataSource.saveUek(uek);
  }

  @override
  Future<void> deleteUek() async {
    await _dataSource.deleteUek();
  }

  @override
  Future<String> loadSck() async {
    return await _dataSource.loadSck();
  }

  @override
  Future<void> saveSck(String sck) async {
    await _dataSource.saveSck(sck);
  }

  @override
  Future<void> deleteSck() async {
    await _dataSource.deleteSck();
  }
}
