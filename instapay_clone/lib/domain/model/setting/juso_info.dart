import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'juso_info.freezed.dart';

part 'juso_info.g.dart';

@freezed
class JusoInfo with _$JusoInfo {
  factory JusoInfo({
    @Default('') String jid,
    @Default('') String jtitle,
    @Default('') String zip,
    @Default('') String fixed,
    @Default('') String user,
    @Default('') String tel,
  }) = _JusoInfo;

  factory JusoInfo.fromJson(Map<String, dynamic> json) =>
      _$JusoInfoFromJson(json);
}
