import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';

class GetPaymentHistoryDataSource {
  static String baseUrl = 'https://api.instapay.kr/v3/trasa';
  final http.Client _client;

  GetPaymentHistoryDataSource({http.Client? client})
      : _client = client ?? http.Client();

  Future<Result<List<PaymentHistoryData>>> getRecentPaymentHistory(
      String tid, int limit) async {
    try {
      final response =
          await _client.get(Uri.parse('$baseUrl?offset=$tid&limit=$limit'));
      final jsonResponse = jsonDecode(response.body);
      Iterable feed = jsonResponse['tras'];
      List<PaymentHistoryData> paymentList =
          feed.map((e) => PaymentHistoryData.fromJson(e)).toList();
      return Result.success(paymentList);
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<List<PaymentHistoryData>>> getMonthPaymentHistory(
      String yearMonth, String tid, int limit) async {
    try {
      final response = await _client
          .get(Uri.parse('$baseUrl?q=$yearMonth&limit=$limit&offset=$tid'));
      final jsonResponse = jsonDecode(response.body);
      Iterable feed = jsonResponse['tras'];
      List<PaymentHistoryData> paymentList =
          feed.map((e) => PaymentHistoryData.fromJson(e)).toList();
      return Result.success(paymentList);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
