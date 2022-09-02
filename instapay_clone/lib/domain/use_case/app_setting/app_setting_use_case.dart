import 'package:instapay_clone/domain/model/app_setting_data/app_setting_data.dart';
import 'package:instapay_clone/domain/repository/app_setting/app_setting_repository.dart';

class AppSettingUseCase {
  final AppSettingRepository repository;

  AppSettingUseCase(this.repository);

  Future<void> insertAppSetting(AppSettingData setting) async {
    await repository.insertAppSetting(setting);
  }

  Future<void> updateAppSetting(AppSettingData setting) async {
    await repository.updateAppSetting(setting);
  }

  Future<AppSettingData> getAppSetting() async {
    return await repository.getAppSetting();
  }
}
