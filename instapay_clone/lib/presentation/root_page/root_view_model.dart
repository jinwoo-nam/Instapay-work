import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/app_setting_data/app_setting_data.dart';
import 'package:instapay_clone/domain/use_case/local/login_pack_use_case.dart';
import 'package:instapay_clone/domain/use_case/local/pin_code_use_case.dart';
import 'package:instapay_clone/domain/use_case/signup/login_use_case.dart';
import 'package:instapay_clone/domain/use_case/user_info/user_info_use_case.dart';
import 'package:instapay_clone/presentation/root_page/root_state.dart';
import 'package:instapay_clone/util/util.dart';

import '../../domain/use_case/app_setting/app_setting_use_case.dart';

class RootViewModel with ChangeNotifier {
  final AppSettingUseCase appSetting;
  final PinCodeUseCase pinCodeUseCase;
  final LoginPackUseCase loginPackUseCacse;
  final LoginUseCase loginUsecase;
  final UserInfoUseCase userInfoUseCase;


  RootViewModel({
    required this.appSetting,
    required this.pinCodeUseCase,
    required this.loginPackUseCacse,
    required this.loginUsecase,
    required this.userInfoUseCase,
  });

  RootState _state = RootState(appSettingData: AppSettingData());

  RootState get state => _state;

  bool isSignIn = false;

  void setSignInResult(bool res) {
    isSignIn = res;
    notifyListeners();
  }

  Future<bool> loadSettingData() async {
    AppSettingData appSettingData = await appSetting.getAppSetting();
    if (!appSettingData.isStartApp) {
      await loginPackUseCacse.deletePack();
    }

    _state = state.copyWith(
      appSettingData: appSettingData,
    );
    return appSettingData.isStartApp;
  }

  Future<void> changeSettingData(AppSettingData appSettingData) async {
    print('change setting');
    _state = state.copyWith(
      appSettingData: appSettingData,
    );

    await appSetting.updateAppSetting(state.appSettingData);
    notifyListeners();
  }

  bool checkAgreeTerms() {
    return state.appSettingData.isAgreeTerms;
  }

  Future<LoginResult> instapayAutoLogin() async {
    final result = await loginUsecase.autoLogin();

    final email = result['email'];
    print(result);
    switch (result['result']) {
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

  Future<String> getPinCode() async {
    return await pinCodeUseCase.loadPinCode();
  }
}
