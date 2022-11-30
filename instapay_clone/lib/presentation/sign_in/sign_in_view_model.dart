import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/use_case/login/apple_signin/google_signin_use_case.dart';
import 'package:instapay_clone/domain/use_case/login/google_signin/google_signin_use_case.dart';
import 'package:instapay_clone/domain/use_case/login/naver_signin/naver_signin_use_case.dart';
import 'package:instapay_clone/domain/use_case/signup/login_use_case.dart';
import 'package:instapay_clone/domain/use_case/user_info/user_info_use_case.dart';
import 'package:instapay_clone/util/util.dart';

class SignInViewModel with ChangeNotifier {
  final LoginUseCase loginUseCase;
  final UserInfoUseCase userInfoUseCase;
  final GoogleSignInUseCase googleSignInUseCase;
  final NaverSignInUseCase naverSignInUseCase;
  final AppleSignInUseCase appleSignInUseCase;

  SignInViewModel({
    required this.loginUseCase,
    required this.userInfoUseCase,
    required this.googleSignInUseCase,
    required this.naverSignInUseCase,
    required this.appleSignInUseCase,
  });

  Future<LoginResult> naverSignin() async {
    String uuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    String bpxlUuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    double latitude = 100;
    double longitude = 100;

    final naverSignIn = await naverSignInUseCase();

    String email = naverSignIn['email'];
    String token = naverSignIn['idToken'];
    final result = await loginUseCase.socialLogin(
        email, uuid, bpxlUuid, latitude, longitude, 'naver', token);
    switch (result) {
      case 'email':
        //이메일 인증 미완료
        return LoginResult.email;
      case 'pin':
        //이메일 인증 완료, pin code 등록 필요
        userInfoUseCase.setUserEmail(email);
        return LoginResult.pin;
      case 'ok':
        //이메일 인증 완료, pin code 등록 완료
        userInfoUseCase.setUserEmail(email);
        return LoginResult.ok;
      default:
        return LoginResult.none;
    }
  }

  Future<LoginResult> appleSignin() async {
    String uuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    String bpxlUuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    double latitude = 100;
    double longitude = 100;

    final appleSignIn = await appleSignInUseCase();

    String email = appleSignIn['email'];
    String token = appleSignIn['idToken'];
    final result = await loginUseCase.socialLogin(
        email, uuid, bpxlUuid, latitude, longitude, 'apple', token);
    switch (result) {
      case 'email':
        //이메일 인증 미완료
        return LoginResult.email;
      case 'pin':
        //이메일 인증 완료, pin code 등록 필요
        userInfoUseCase.setUserEmail(email);
        return LoginResult.pin;
      case 'ok':
        //이메일 인증 완료, pin code 등록 완료
        userInfoUseCase.setUserEmail(email);
        return LoginResult.ok;
      default:
        return LoginResult.none;
    }
  }

  Future<LoginResult> googleSignin() async {
    String uuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    String bpxlUuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    double latitude = 100;
    double longitude = 100;

    final googleSignIn = await googleSignInUseCase();
    String email = googleSignIn['email'];
    String token = googleSignIn['idToken'];
    final result = await loginUseCase.socialLogin(
        email, uuid, bpxlUuid, latitude, longitude, 'google', token);
    switch (result) {
      case 'email':
        //이메일 인증 미완료
        return LoginResult.email;
      case 'pin':
        //이메일 인증 완료, pin code 등록 필요
        userInfoUseCase.setUserEmail(email);
        return LoginResult.pin;
      case 'ok':
        //이메일 인증 완료, pin code 등록 완료
        userInfoUseCase.setUserEmail(email);
        return LoginResult.ok;
      default:
        return LoginResult.none;
    }
  }

  Future<LoginResult> instapayLogin(String email) async {
    String uuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    String bpxlUuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    double latitude = 100;
    double longitude = 100;

    final result =
        await loginUseCase(email, uuid, bpxlUuid, latitude, longitude);

    switch (result) {
      case 'email':
        //이메일 인증 미완료
        return LoginResult.email;
      case 'pin':
        //이메일 인증 완료, pin code 등록 필요
        userInfoUseCase.setUserEmail(email);
        return LoginResult.pin;
      case 'ok':
        //이메일 인증 완료, pin code 등록 완료
        userInfoUseCase.setUserEmail(email);
        return LoginResult.ok;
      default:
        return LoginResult.none;
    }
  }

  Future<LoginResult> instapayEmailCheck(String email) async {
    String uuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    String bpxlUuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    double latitude = 100;
    double longitude = 100;

    final result = await loginUseCase(
      email,
      uuid,
      bpxlUuid,
      latitude,
      longitude,
      isEmailCheck: true,
    );

    switch (result) {
      case 'email':
        //이메일 인증 미완료
        return LoginResult.email;
      case 'pin':
        //이메일 인증 완료, pin code 등록 필요
        userInfoUseCase.setUserEmail(email);
        return LoginResult.pin;
      case 'ok':
        //이메일 인증 완료, pin code 등록 완료
        userInfoUseCase.setUserEmail(email);
        return LoginResult.ok;
      default:
        return LoginResult.none;
    }
  }
}
