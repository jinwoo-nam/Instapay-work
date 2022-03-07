import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'terms_of_use_list_data.freezed.dart';
part 'terms_of_use_list_data.g.dart';

@freezed
class TermsOfUseListData with _$TermsOfUseListData {
  factory TermsOfUseListData({
    required String title,
    required String content,
  }) = _TermsOfUseListData;
  factory TermsOfUseListData.fromJson(Map<String, dynamic> json) => _$TermsOfUseListDataFromJson(json);
}