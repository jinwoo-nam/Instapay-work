import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/my_wallet/means_data.dart';
import 'package:instapay_clone/domain/repository/local/login_info_repository.dart';
import 'package:instapay_clone/domain/repository/means/means_repository.dart';

class GetMeansUseCase {
  final MeansRepository meansRepository;
  final LoginInfoRepository loginInfoRepository;

  GetMeansUseCase({
    required this.meansRepository,
    required this.loginInfoRepository,
  });

  Future<Result<List<MeansData>>> call() async {
    String token = await loginInfoRepository.loadAccessToken();
    return await meansRepository.getMeans(token);
  }
}
