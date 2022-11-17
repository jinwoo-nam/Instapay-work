import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/data/data_source/juso/juso_api.dart';
import 'package:instapay_clone/domain/model/setting/juso_info.dart';
import 'package:instapay_clone/domain/repository/juso/juso_repository.dart';

class JusoRepositoryImpl extends JusoRepository {
  final JusoApi _dataSource = JusoApi();

  @override
  Future<void> createJuso(String token, String pack) async {
    await _dataSource.createJuso(token, pack);
  }

  @override
  Future<Result<List<JusoInfo>>> getJuso(String token) async {
    return await _dataSource.getJuso(token);
  }

  @override
  Future<void> deleteJuso(String token, String jid) async {
    await _dataSource.deleteJuso(token, jid);
  }

  @override
  Future<void> updateJuso(String token, String jid) async {
    await _dataSource.updateJuso(token, jid);
  }
}
