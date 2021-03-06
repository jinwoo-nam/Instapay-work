import 'package:freezed_annotation/freezed_annotation.dart';
part 'notice_list_data.freezed.dart';
part 'notice_list_data.g.dart';

@freezed
class NoticeListData with _$NoticeListData {
  factory NoticeListData({
    required String ftitle,
    required String fmsg,
    required String adate,
  }) = _NoticeListData;
  factory NoticeListData.fromJson(Map<String, dynamic> json) => _$NoticeListDataFromJson(json);
}