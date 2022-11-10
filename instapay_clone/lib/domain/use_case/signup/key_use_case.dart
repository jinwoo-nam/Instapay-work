import 'package:instapay_clone/domain/repository/local/key_result_repository.dart';
import 'package:instapay_clone/domain/repository/signup/key_repository.dart';
import 'package:instapay_clone/util/util_encode.dart';

class KeyUseCase {
  KeyRepository keyRepository;
  KeyResultRepository keyResultRepository;

  KeyUseCase({
    required this.keyRepository,
    required this.keyResultRepository,
  });

  Future<String> call(String token, String salt, String pinCode) async {
    salt = salt.isEmpty ? 'o20holr15p04o0611z54g10wp' : salt;
    String key = sha1HmacEncode(pinCode, salt);
    String apiResult = '';

    print('key : $key');
    print('token : $token');
    final result = await keyRepository.keyApi(token, key);
    await result.when(success: (keyResult) async {
      String uek = keyResult.uek;
      String sck = keyResult.sck;
      apiResult = keyResult.result;
      await keyResultRepository.saveUek(uek);
      await keyResultRepository.saveSck(sck);
    }, error: (message) {
      print(message);
    });

    return apiResult;
  }
}
