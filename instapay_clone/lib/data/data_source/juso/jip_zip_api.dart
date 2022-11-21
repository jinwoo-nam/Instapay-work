import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/juso_search_result_data.dart';

class JipZipApi {
  static String jipBaseUrl = 'https://api.instapay.kr/v3/jip';
  static String zipBaseUrl = 'https://api.instapay.kr/v3/zip';

  final http.Client _client = http.Client();

  Future<void> getJip(String token, String jip) async {
    try {
      http.Response response;
      Uri uri = Uri.parse(jipBaseUrl);
      response = await _client.post(
        uri,
        body: {
          'token': token,
          's': jip,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('get jip api의 응답 코드가 200이 아닙니다.');
      }
      print(response.body);
      final json = jsonDecode(response.body);
      if (json['status'] != "1" && json['status'] != 1) {
        throw Exception(
            'get jip api의 결과 status가 1이 아닙니다. (status : ${json['status']})');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Result<List<JusoSearchResultData>>> getZip(
      String token, String zip) async {
    try {
      http.Response response;
      Uri uri = Uri.parse(zipBaseUrl);
      response = await _client.post(
        uri,
        body: {
          'token': token,
          's': zip,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('get zip api의 응답 코드가 200이 아닙니다.');
      }
      print(response.body);
      final json = jsonDecode(response.body);
      if (json['status'] != "1" && json['status'] != 1) {
        throw Exception(
            'get zip api의 결과 status가 1이 아닙니다. (status : ${json['status']})');
      }
      Iterable jusoIterable = json['juso'];
      List<JusoSearchResultData> resultList =
          jusoIterable.map((e) => JusoSearchResultData.fromJson(e)).toList();

      return Result.success(resultList);
    } catch (e) {
      print(e.toString());
      return Result.error(e.toString());
    }
  }
}
