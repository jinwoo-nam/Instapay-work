import 'package:instapay_clone/domain/model/app_setting_data/app_setting_data.dart';
import 'package:sqflite/sqflite.dart';

class AppSettingDb {
  Database db;

  AppSettingDb(this.db);

  Future<void> insertAppSetting(AppSettingData setting) async {
    await db.insert(
      'app_setting',
      {
        'isStartApp': setting.isStartApp ? 1 : 0,
        'isAgreeTerms': setting.isAgreeTerms ? 1 : 0,
      },
    );

    final result = await getAppSetting();
    print('test get value : ${result.isStartApp}');
  }

  Future<void> updateAppSetting(AppSettingData setting) async {
    await db.update(
      'app_setting',
      {
        'isStartApp': setting.isStartApp ? 1 : 0,
        'isAgreeTerms': setting.isAgreeTerms ? 1 : 0,
      },
    );
  }

  Future<AppSettingData> getAppSetting() async {
    List<Map<String, dynamic>> maps = await db.query('app_setting');

    if (maps.isEmpty) {
      final temp = AppSettingData(
        isAgreeTerms: false,
        isStartApp: false,
      );
      await insertAppSetting(temp);
      return temp;
    } else {
      return AppSettingData(
        isStartApp: maps.first['isStartApp'] == 1 ? true : false,
        isAgreeTerms: maps.first['isAgreeTerms'] == 1 ? true : false,
      );
    }
  }
}
