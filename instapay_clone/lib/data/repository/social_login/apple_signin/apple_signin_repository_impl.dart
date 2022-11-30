import 'dart:convert';

import 'package:instapay_clone/domain/repository/social_signin/social_signin_repository.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleSignInRepositoryImpl extends SocialSignInRepository {
  @override
  Future<Map<String, dynamic>> socialSigninIn() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
      ],
    );
    List<String> jwt = credential.identityToken?.split('.') ?? [];
    String payload = jwt[1];
    payload = base64.normalize(payload);
//    print(base64.normalize(payload));

    // if (payload.isEmpty) {
    //   return {
    //     //에러처리
    //   };
    // } else {
    //   if (payload.length % 4 != 0) {
    //     payload += '=' * (4 - (payload.length % 4));
    //   }
    // }

    final List<int> jsonData = base64.decode(payload);
    final userInfo = jsonDecode(utf8.decode(jsonData));
    print(userInfo);
    String email = userInfo['email'];


    String token = credential.identityToken ?? '';

    return {
      'email': email,
      'idToken': token,
    };
  }
}
