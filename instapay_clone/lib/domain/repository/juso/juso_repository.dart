import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/juso_info.dart';

abstract class JusoRepository {
  Future<void> createJuso(String token, String pack);

  Future<Result<List<JusoInfo>>> getJuso(String token);

  Future<void> deleteJuso(String token, String jid);

  Future<void> updateJuso(String token, String jid);
}
