import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'juso_search_result_data.freezed.dart';

part 'juso_search_result_data.g.dart';

@freezed
class JusoSearchResultData with _$JusoSearchResultData {
  factory JusoSearchResultData({
    @Default('') String juso,
    @Default('') String nzip,
    @Default('') String zip,
  }) = _JusoSearchResultData;

  factory JusoSearchResultData.fromJson(Map<String, dynamic> json) =>
      _$JusoSearchResultDataFromJson(json);
}
