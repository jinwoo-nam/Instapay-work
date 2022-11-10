import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'key_result_data.freezed.dart';
part 'key_result_data.g.dart';

@freezed
class KeyResultData with _$KeyResultData {
  factory KeyResultData({
    required String result,
    @JsonKey(name:"UEK") required String uek,
    @JsonKey(name:"SCK") required String sck,
  }) = _KeyResultData;
  factory KeyResultData.fromJson(Map<String, dynamic> json) => _$KeyResultDataFromJson(json);
}