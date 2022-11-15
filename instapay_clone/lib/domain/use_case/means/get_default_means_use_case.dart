import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/repository/local/login_info_repository.dart';
import 'package:instapay_clone/domain/repository/means/means_repository.dart';

class GetDefaultMeansUseCase {
  final MeansRepository meansRepository;
  final LoginInfoRepository loginInfoRepository;

  GetDefaultMeansUseCase({
    required this.meansRepository,
    required this.loginInfoRepository,
  });

  Future<Result<String>> call() async {
    String token = await loginInfoRepository.loadAccessToken();
    return await meansRepository.getDefaultMeans(token);
  }
}
