import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/app_setting_data/app_setting_data.dart';
import 'package:instapay_clone/presentation/root_page/root_state.dart';

import '../../domain/use_case/app_setting/app_setting_use_case.dart';

class RootViewModel with ChangeNotifier {
  final AppSettingUseCase appSetting;

  RootViewModel({
    required this.appSetting,
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

    _state = state.copyWith(
      appSettingData: appSettingData,
    );
    notifyListeners();
  }

  Future<void> changeSettingData() async {
    print('change setting');
    _state = state.copyWith(
      appSettingData: AppSettingData(isStartApp: true),
    );

    await appSetting.insertAppSetting(state.appSettingData);
    notifyListeners();
  }
}
