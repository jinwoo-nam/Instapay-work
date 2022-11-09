import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/sign_up/login_result_data.dart';

class SignupApi {
  static String mLoginBaseUrl = 'https://api.instapay.kr/v3/mlogin';

  final http.Client _client = http.Client();

  Future<Result<LoginResultData>> login(
      String aid, String pack, String pack_h) async {
    try {
      http.Response response;
      Uri uri = Uri.parse(mLoginBaseUrl);
      response = await _client.post(
        uri,
        body: {'aid': aid, 'pack': pack, 'pack_h': pack_h},
      );
      while (response.headers['location'] != null) {
        uri = uri.resolve(response.headers['location']!);
        response = await _client.post(
          uri,
          body: {'aid': aid, 'pack': pack, 'pack_h': pack_h},
        );
      }
      if (response.statusCode != 200) {
        throw Exception('mlogin 응답 코드가 200이 아닙니다.');
      }
      print(response.body);
      final json = jsonDecode(response.body);
      final loginResult = LoginResultData.fromJson(json);
      return Result.success(loginResult);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
