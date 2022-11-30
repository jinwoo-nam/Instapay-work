import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:instapay_clone/domain/repository/social_signin/social_signin_repository.dart';

class NaverSignInRepositoryImpl extends SocialSignInRepository {
  @override
  Future<Map<String, dynamic>> socialSigninIn() async {
    final NaverLoginResult logout =
        await FlutterNaverLogin.logOutAndDeleteToken();
    print(logout);
    final NaverLoginResult res = await FlutterNaverLogin.logIn();
    NaverAccessToken token = await FlutterNaverLogin.currentAccessToken;

    return {
      'email': res.account.email,
      'idToken': token.accessToken,
    };
  }
}
