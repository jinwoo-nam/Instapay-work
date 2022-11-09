import 'package:instapay_clone/domain/model/app_setting_data/app_setting_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'root_state.freezed.dart';

part 'root_state.g.dart';

@freezed
class RootState with _$RootState {
  factory RootState({
    required AppSettingData appSettingData,
    @Default('') String pinCode,
  }) = _RootState;

  factory RootState.fromJson(Map<String, dynamic> json) =>
      _$RootStateFromJson(json);
}
