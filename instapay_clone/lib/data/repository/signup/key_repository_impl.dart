import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/data/data_source/signup/key_api.dart';
import 'package:instapay_clone/domain/model/sign_up/key_result_data.dart';
import 'package:instapay_clone/domain/repository/signup/key_repository.dart';

class KeyRepositoryImpl implements KeyRepository {
  final KeyApi _dataSource = KeyApi();

  @override
  Future<Result<KeyResultData>> keyApi(String token, String key) async {
    return await _dataSource.keyApi(token, key);
  }
}
