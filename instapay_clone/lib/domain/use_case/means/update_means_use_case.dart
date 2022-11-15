import 'package:instapay_clone/domain/repository/local/login_info_repository.dart';
import 'package:instapay_clone/domain/repository/means/means_repository.dart';

class UpdateMeansUseCase {
  final MeansRepository meansRepository;
  final LoginInfoRepository loginInfoRepository;

  UpdateMeansUseCase({
    required this.meansRepository,
    required this.loginInfoRepository,
  });

  Future<void> call(String mid) async {
    String token = await loginInfoRepository.loadAccessToken();
    return await meansRepository.updateMeans(token, mid);
  }
}
