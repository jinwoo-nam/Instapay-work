import 'package:instapay_clone/domain/repository/social_signin/social_signin_repository.dart';

class GoogleSignInUseCase {
  final SocialSignInRepository googleSignInRepository;

  GoogleSignInUseCase({
    required this.googleSignInRepository,
  });

  Future<Map<String,dynamic>> call() async {
    return await googleSignInRepository.socialSigninIn();
  }
}
