import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'means_data.freezed.dart';

part 'means_data.g.dart';

@freezed
class MeansData with _$MeansData {
  factory MeansData({
    @Default('') String mid,
    @Default('') String adate,
    @Default('') String mtype,
    @Default('') String mname,
    dynamic mnum,
    @Default('') String balance,
    @Default(false) bool def,
  }) = _MeansData;

  factory MeansData.fromJson(Map<String, dynamic> json) =>
      _$MeansDataFromJson(json);
}
