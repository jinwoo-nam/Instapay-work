import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';

class GetPaymentHistoryDataSource {
  static String baseUrl = 'https://api.instapay.kr/v3/trasa';
  final http.Client _client;

  GetPaymentHistoryDataSource({http.Client? client})
      : _client = client ?? http.Client();

  Future<Result<List<PaymentHistoryData>>> getPaymentHistory() async {
    try {
      final response = await _client.get(Uri.parse(baseUrl));
      final jsonResponse = jsonDecode(response.body);
      Iterable feed = jsonResponse['tras'];
      List<PaymentHistoryData> paymentList =
          feed.map((e) => PaymentHistoryData.fromJson(e)).toList();

      paymentList.add(
        PaymentHistoryData(
          mname: 'INC',
          gname: 'Test Book',
          renum: 'TES-T10VS',
          adate: '2021-04-02 14:00:00',
          tstatus: 'complete',
          tsum: '127',
          sname: '인스타북스',
          mesg: '인스타북스',
          hstatus: 'complete',
        ),
      );
      return Result.success(paymentList);
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }
}
