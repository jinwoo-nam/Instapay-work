import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/app_setting_data/app_setting_data.dart';
import 'package:instapay_clone/domain/use_case/local/login_pack_use_case.dart';
import 'package:instapay_clone/domain/use_case/local/pin_code_use_case.dart';
import 'package:instapay_clone/presentation/root_page/root_state.dart';

import '../../domain/use_case/app_setting/app_setting_use_case.dart';

class RootViewModel with ChangeNotifier {
  final AppSettingUseCase appSetting;
  final PinCodeUseCase pinCodeUseCase;
  final LoginPackUseCase loginPackUseCacse;

  RootViewModel({
    required this.appSetting,
    required this.pinCodeUseCase,
    required this.loginPackUseCacse,
  });

  RootState _state = RootState(appSettingData: AppSettingData());

  RootState get state => _state;

  bool isSignIn = false;

  void setSignInResult(bool res) {
    isSignIn = res;
    notifyListeners();
  }

  Future<void> loadSettingData() async {
    AppSettingData appSettingData = await appSetting.getAppSetting();
    if (!appSettingData.isStartApp) {
      loginPackUseCacse.deletePack();
    }

    _state = state.copyWith(
      appSettingData: appSettingData,
    );
    notifyListeners();
  }

  Future<void> changeSettingData(AppSettingData appSettingData) async {
    print('change setting');
    _state = state.copyWith(
      appSettingData: appSettingData,
    );

    await appSetting.updateAppSetting(state.appSettingData);
    notifyListeners();
  }

  Future<String> getPinCode() async {
    return await pinCodeUseCase.loadPinCode();
  }
}
