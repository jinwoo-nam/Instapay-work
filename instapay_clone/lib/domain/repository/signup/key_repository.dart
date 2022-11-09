import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/sign_up/key_result_data.dart';

abstract class KeyRepository {
  Future<Result<KeyResultData>> keyApi(String token, String key);
}
