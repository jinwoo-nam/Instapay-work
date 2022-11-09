import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/use_case/signup/login_use_case.dart';
import 'package:instapay_clone/presentation/sign_in/sign_in_state.dart';

class SignInViewModel with ChangeNotifier {
  final LoginUseCase loginUsecase;

  SignInViewModel({required this.loginUsecase});

  SignInState _state = SignInState();

  SignInState get state => _state;

  Future<void> instapayLogin(String email) async {
    String uuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    String bpxlUuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    double latitude = 100;
    double longitude = 100;

    final result =
        await loginUsecase(email, uuid, bpxlUuid, latitude, longitude);
    result.when(success: (loginResult) {
      _state = state.copyWith(
        loginResult: loginResult,
      );
    }, error: (message) {
      print(message);
    });
  }

  Future<bool> instapayEmailCheck() async {
    String uuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    String bpxlUuid = "53d90ca4-58e9-11ed-9b6a-0242ac120002";
    double latitude = 100;
    double longitude = 100;
    String email = '';
    String salt = '';
    if (state.loginResult == null) {
      return false;
    }
    email = state.loginResult!.email;
    salt = state.loginResult!.salt;
    bool isSuccess = false;

    final result = await loginUsecase(
        email, uuid, bpxlUuid, latitude, longitude,
        salt: salt);
    isSuccess = result.when(success: (loginResult) {
      if (loginResult.result == 'pin') {
        _state = state.copyWith(
          loginResult: loginResult,
        );
        return true;
      } else {
        return false;
      }
    }, error: (message) {
      print(message);
      return false;
    });

    return isSuccess;
  }
}
