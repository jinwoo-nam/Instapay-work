import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/kfc/kfc_first_result.dart';
import 'package:instapay_clone/domain/repository/kfc/kfc_repository.dart';
import 'package:instapay_clone/domain/repository/local/login_info_repository.dart';

class KfcUseCase {
  KfcRepository kfcRepository;
  LoginInfoRepository loginInfo;

  KfcUseCase({
    required this.kfcRepository,
    required this.loginInfo,
  });

  Future<Result<KfcFirstResult>> kfcFirst() async {
    String token = await loginInfo.loadAccessToken();
    print('kfc first token : $token');
    return await kfcRepository.kfcFirst(token);
  }
}
