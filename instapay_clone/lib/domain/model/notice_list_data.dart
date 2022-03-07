import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'notice_list_data.freezed.dart';
part 'notice_list_data.g.dart';

@freezed
class NoticeListData with _$NoticeListData {
  factory NoticeListData({
    required String title,
    required String content,
    required String date,
  }) = _NoticeListData;
  factory NoticeListData.fromJson(Map<String, dynamic> json) => _$NoticeListDataFromJson(json);
}