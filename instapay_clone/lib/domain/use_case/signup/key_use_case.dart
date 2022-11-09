import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/sign_up/key_result_data.dart';
import 'package:instapay_clone/domain/repository/signup/key_repository.dart';

class KeyUseCase {
  KeyRepository keyRepository;

  KeyUseCase(this.keyRepository);

  Future<Result<KeyResultData>> call(String token, String key) async {
    return await keyRepository.keyApi(token, key);
  }
}
