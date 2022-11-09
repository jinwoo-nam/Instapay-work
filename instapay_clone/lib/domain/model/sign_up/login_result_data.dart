import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_result_data.freezed.dart';
part 'login_result_data.g.dart';

@freezed
class LoginResultData with _$LoginResultData {
  factory LoginResultData({
    required String result,
    required String salt,
    required String token,
    required String email,
    int? refresh,
    String? toast,
    String? flag,
    String? uid,
    String? eurl,
  }) = _LoginResultData;
  factory LoginResultData.fromJson(Map<String, dynamic> json) => _$LoginResultDataFromJson(json);
}