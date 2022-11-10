import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kfc_first_result.freezed.dart';

part 'kfc_first_result.g.dart';

@freezed
class KfcFirstResult with _$KfcFirstResult {
  factory KfcFirstResult({
    required String result,
    required String uri,
    required String uria,
    required String urib,
  }) = _KfcFirstResult;

  factory KfcFirstResult.fromJson(Map<String, dynamic> json) =>
      _$KfcFirstResultFromJson(json);
}
