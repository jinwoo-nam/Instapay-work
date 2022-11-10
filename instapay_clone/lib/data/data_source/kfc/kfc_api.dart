import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/kfc/kfc_first_result.dart';

class KfcApi {
  static String kfcFirstUrl = 'https://api.instapay.kr/v3/kfcfirst';

  final http.Client _client = http.Client();

  Future<Result<KfcFirstResult>> kfcFirst(String token) async {
    try {
      http.Response response;
      Uri uri = Uri.parse(kfcFirstUrl);
      response = await _client.post(
        uri,
        body: {
          'token': token,
        },
      );
      print(response.body);
      if (response.statusCode != 200) {
        throw Exception('key api의 응답 코드가 200이 아닙니다.');
      }
      final json = jsonDecode(response.body);
      if (json['status'] != "1") {
        throw Exception(
            'key api의 결과 status가 1이 아닙니다. (status : ${json['status']})');
      }
      final kfcResult = KfcFirstResult.fromJson(json);
      return Result.success(kfcResult);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
