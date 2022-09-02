import 'package:instapay_clone/domain/model/app_setting_data/app_setting_data.dart';
import 'package:sqflite/sqflite.dart';

class AppSettingDb {
  Database db;

  AppSettingDb(this.db);

  Future<void> insertAppSetting(AppSettingData setting) async {
    print('insert app setting');
    await db.insert(
      'app_setting',
      {
        'isStartApp': setting.isStartApp ? 1 : 0,
      },
    );
  }

  Future<void> updateAppSetting(AppSettingData setting) async {
    await db.update(
      'app_setting',
      {
        'isStartApp': setting.isStartApp ? 1 : 0,
      },
    );
  }

  Future<AppSettingData> getAppSetting() async {
    print('get app setting');
    List<Map<String, dynamic>> maps = await db.query('app_setting');

    if (maps.isEmpty) {
      return AppSettingData();
    } else {
      print(maps.first['isStartApp']);

      await updateAppSetting(AppSettingData(
        isStartApp: false,
      ));

      return AppSettingData(
          isStartApp: maps.first['isStartApp'] == 1 ? true : false);
    }
  }
}
