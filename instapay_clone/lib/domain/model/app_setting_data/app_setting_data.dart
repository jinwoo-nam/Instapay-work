import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_setting_data.freezed.dart';
part 'app_setting_data.g.dart';

@freezed
class AppSettingData with _$AppSettingData {
  factory AppSettingData({
    @Default(false) bool isStartApp,
  }) = _AppSettingData;
  factory AppSettingData.fromJson(Map<String, dynamic> json) => _$AppSettingDataFromJson(json);
}