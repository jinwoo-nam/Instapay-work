import 'package:instapay_clone/domain/model/app_setting_data/app_setting_data.dart';

abstract class AppSettingRepository {
  Future<void> insertAppSetting(AppSettingData setting);

  Future<void> updateAppSetting(AppSettingData setting);

  Future<AppSettingData> getAppSetting();
}
