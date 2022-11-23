import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_data.freezed.dart';

part 'user_info_data.g.dart';

@freezed
class UserInfoData with _$UserInfoData {
  factory UserInfoData({
    @Default('') String email,
    @Default('') String name,
  }) = _UserInfoData;

  factory UserInfoData.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDataFromJson(json);
}
