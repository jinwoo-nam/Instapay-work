import 'package:instapay_clone/data/data_source/app_setting/app_setting_db.dart';
import 'package:instapay_clone/domain/model/app_setting_data/app_setting_data.dart';
import 'package:instapay_clone/domain/repository/app_setting/app_setting_repository.dart';

class AppSettingRepositoryImpl implements AppSettingRepository {
  final AppSettingDb dataSource;

  AppSettingRepositoryImpl(this.dataSource);

  @override
  Future<AppSettingData> getAppSetting() async {
    return await dataSource.getAppSetting();
  }

  @override
  Future<void> insertAppSetting(AppSettingData setting) async {
    await dataSource.insertAppSetting(setting);
  }

  @override
  Future<void> updateAppSetting(AppSettingData setting) async {
    await dataSource.updateAppSetting(setting);
  }
}
