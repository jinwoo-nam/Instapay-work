import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/juso_info.dart';
import 'package:instapay_clone/domain/repository/juso/juso_repository.dart';
import 'package:instapay_clone/domain/repository/local/login_info_repository.dart';

class GetJusoUseCase {
  final LoginInfoRepository loginInfoRepository;
  final JusoRepository jusoRepository;

  GetJusoUseCase({
    required this.loginInfoRepository,
    required this.jusoRepository,
  });

  Future<Result<List<JusoInfo>>> call() async {
    String token = await loginInfoRepository.loadAccessToken();
    return await jusoRepository.getJuso(token);
  }
}
