import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';

class TrasApi {
  static String trasBaseUrl = 'https://api.instapay.kr/v3/tras';

  final http.Client _client = http.Client();

  Future<Result<List<PaymentHistoryData>>> getTras(
      String token, String tid, int limit,
      {String yearMonth = '', startDate = '', endDate = ''}) async {
    try {
      http.Response response;
      Uri uri = Uri.parse(trasBaseUrl);
      response = await _client.post(
        uri,
        body: {
          'token': token,
          'offset': tid,
          'limit': limit.toString(),
          'q': yearMonth,
          'startDate': startDate,
          'endDate': endDate,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('key api의 응답 코드가 200이 아닙니다.');
      }
      print(response.body);
      final json = jsonDecode(response.body);
      if (json['status'] != "1" && json['status'] != 1) {
        throw Exception(
            'key api의 결과 status가 1이 아닙니다. (status : ${json['status']})');
      }

      Iterable feed = json['tras'];
      List<PaymentHistoryData> paymentList =
          feed.map((e) => PaymentHistoryData.fromJson(e)).toList();

      return Result.success(paymentList);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
