import 'package:instapay_clone/domain/repository/juso/juso_repository.dart';
import 'package:instapay_clone/domain/repository/local/login_info_repository.dart';

class UpdateJusoUseCase {
  final LoginInfoRepository loginInfoRepository;
  final JusoRepository jusoRepository;

  UpdateJusoUseCase({
    required this.loginInfoRepository,
    required this.jusoRepository,
  });

  Future<void> call(String jid) async {
    String token = await loginInfoRepository.loadAccessToken();
    return await jusoRepository.updateJuso(token, jid);
  }
}
