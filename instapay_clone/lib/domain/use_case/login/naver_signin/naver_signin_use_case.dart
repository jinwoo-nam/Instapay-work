import 'package:instapay_clone/domain/repository/social_signin/social_signin_repository.dart';

class NaverSignInUseCase {
  final SocialSignInRepository naverSignInRepository;

  NaverSignInUseCase({
    required this.naverSignInRepository,
  });

  Future<Map<String, dynamic>> call() async {
    return await naverSignInRepository.socialSigninIn();
  }
}
