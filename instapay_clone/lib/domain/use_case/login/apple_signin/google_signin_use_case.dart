import 'package:instapay_clone/domain/repository/social_signin/social_signin_repository.dart';

class AppleSignInUseCase {
  final SocialSignInRepository appleSignInRepository;

  AppleSignInUseCase({
    required this.appleSignInRepository,
  });

  Future<Map<String,dynamic>> call() async {
    return await appleSignInRepository.socialSigninIn();
  }
}
