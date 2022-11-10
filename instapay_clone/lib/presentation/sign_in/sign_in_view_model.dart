import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/use_case/signup/login_use_case.dart';

class SignInViewModel with ChangeNotifier {
  final LoginUseCase loginUsecase;

  SignInViewModel({
    required this.loginUsecase,
  });

  Future<bool> instapayLogin(String email) async {
    String uuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    String bpxlUuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    double latitude = 100;
    double longitude = 100;

    final result =
        await loginUsecase(email, uuid, bpxlUuid, latitude, longitude);

    return result;
  }

  Future<bool> instapayEmailCheck(String email) async {
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

    return result;
  }
}
