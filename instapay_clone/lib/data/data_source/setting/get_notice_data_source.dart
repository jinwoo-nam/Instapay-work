import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/notice_list_data.dart';

class GetNoticeDataSource {
  static String baseUrl = 'https://api.instapay.kr/v3/feeds';
  final http.Client _client;

  GetNoticeDataSource({http.Client? client})
      : _client = client ?? http.Client();

  Future<Result<List<NoticeListData>>> getNoticeList() async {
    try {
      final response = await _client.get(Uri.parse(baseUrl));
      final jsonResponse = jsonDecode(response.body);
      Iterable feed = jsonResponse['feeds'];
      List<NoticeListData> noticeList =
          feed.map((e) => NoticeListData.fromJson(e)).toList();
      return Result.success(noticeList);
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }
}
