import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/use_case/signup/login_use_case.dart';
import 'package:instapay_clone/domain/use_case/user_info/user_info_use_case.dart';
import 'package:instapay_clone/util/util.dart';

class SignInViewModel with ChangeNotifier {
  final LoginUseCase loginUsecase;
  final UserInfoUseCase userInfoUseCase;

  SignInViewModel({
    required this.loginUsecase,
    required this.userInfoUseCase,
  });

  Future<LoginResult> instapayLogin(String email) async {
    String uuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    String bpxlUuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    double latitude = 100;
    double longitude = 100;

    final result =
        await loginUsecase(email, uuid, bpxlUuid, latitude, longitude);

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

    final result = await loginUsecase(
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
