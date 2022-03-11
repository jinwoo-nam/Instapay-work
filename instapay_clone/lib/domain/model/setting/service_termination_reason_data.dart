import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_termination_reason_data.freezed.dart';

part 'service_termination_reason_data.g.dart';

@freezed
class ServiceTerminationReasonData with _$ServiceTerminationReasonData {
  factory ServiceTerminationReasonData({
    required String title,
    required ServiceTerminationReasonType type,
  }) = _ServiceTerminationReasonData;

  factory ServiceTerminationReasonData.fromJson(Map<String, dynamic> json) =>
      _$ServiceTerminationReasonDataFromJson(json);
}

enum ServiceTerminationReasonType {
  None,
  Useless,
  UnComfortable,
  SoftwareIssues,
  SecurityIssues,
  NoAccount,
  Testing,
  Etc,
}
