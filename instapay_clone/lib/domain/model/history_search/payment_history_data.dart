import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_history_data.freezed.dart';

part 'payment_history_data.g.dart';

@freezed
class PaymentHistoryData with _$PaymentHistoryData {
  factory PaymentHistoryData({
    required String gname,
    required String renum,
    required String adate,
    required dynamic tsum,
    String? means,
    required String mname,
    required String tstatus,
    required String hstatus,
    required String sname,
    String? m_ord_id,
    String? gtype,
    String? zip,
    String? juso,
    String? gid,
    String? tid,
    String? trak,
    String? ca,
    String? etc,
    required String mesg,
  }) = _PaymentHistoryData;

  factory PaymentHistoryData.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoryDataFromJson(json);
}
