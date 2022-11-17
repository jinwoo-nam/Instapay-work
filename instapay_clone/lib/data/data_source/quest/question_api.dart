import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instapay_clone/core/result.dart';

class QuestionApi {
  static String questBaseUrl = 'https://api.instapay.kr/v3/quest';

  final http.Client _client = http.Client();

  Future<Result<String>> questionApi(
      String token, String sub, String msg) async {
    try {
      http.Response response;
      Uri uri = Uri.parse(questBaseUrl);
      response = await _client.post(
        uri,
        body: {
          'token': token,
          'subj': sub,
          'msg': msg,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('question api의 응답 코드가 200이 아닙니다.');
      }
      print(response.body);
      final json = jsonDecode(response.body);
      if (json['status'] != "1" && json['status'] != 1) {
        throw Exception(
            'question api의 결과 status가 1이 아닙니다. (status : ${json['status']})');
      }
      String result = json['result'] ?? '';
      return Result.success(result);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
