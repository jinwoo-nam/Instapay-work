import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/repository/local/login_info_repository.dart';
import 'package:instapay_clone/domain/repository/means/means_repository.dart';

class DeleteMeansUseCase {
  final MeansRepository meansRepository;
  final LoginInfoRepository loginInfoRepository;

  DeleteMeansUseCase({
    required this.meansRepository,
    required this.loginInfoRepository,
  });

  Future<Result<String>> call(String mid) async {
    String token = await loginInfoRepository.loadAccessToken();
    return await meansRepository.deleteMeans(token, mid);
  }
}
