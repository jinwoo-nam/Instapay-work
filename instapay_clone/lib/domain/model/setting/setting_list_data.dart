import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_list_data.freezed.dart';

part 'setting_list_data.g.dart';

@freezed
class SettingListData with _$SettingListData {
  factory SettingListData({
    required String title,
    required bool isTrailing,
    required SettingType type,
    String? subTitle,
  }) = _SettingListData;

  factory SettingListData.fromJson(Map<String, dynamic> json) =>
      _$SettingListDataFromJson(json);
}

enum SettingType {
  paymentCodeChange,
  address,
  appVersion,
  notice,
  termsOfUse,
  inquiry,
  serviceTermination
}
