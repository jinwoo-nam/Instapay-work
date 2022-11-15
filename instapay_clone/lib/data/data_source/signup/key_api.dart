import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/sign_up/key_result_data.dart';

class KeyApi {
  static String mKeyBaseUrl = 'https://api.instapay.kr/v3/key';

  final http.Client _client = http.Client();

  Future<Result<KeyResultData>> keyApi(String token, String key) async {
    try {
      http.Response response;
      Uri uri = Uri.parse(mKeyBaseUrl);
      response = await _client.post(
        uri,
        body: {
          'token': token,
          'key': key,
        },
      );
      // while (response.headers['location'] != null) {
      //   uri = uri.resolve(response.headers['location']!);
      //   response = await _client.post(
      //     uri,
      //     body: {'aid': aid, 'pack': pack, 'pack_h': pack_h},
      //   );
      // }
      if (response.statusCode != 200) {
        throw Exception('key api의 응답 코드가 200이 아닙니다.');
      }
      print(response.body);
      final json = jsonDecode(response.body);
      if (json['status'] != "1" && json['status'] != 1) {
        throw Exception(
            'key api의 결과 status가 1이 아닙니다. (status : ${json['status']})');
      }
      final loginResult = KeyResultData.fromJson(json);
      return Result.success(loginResult);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
