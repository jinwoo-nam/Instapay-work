import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/juso_info.dart';

class JusoApi {
  static String jusoBaseUrl = 'https://api.instapay.kr/v3/juso';

  final http.Client _client = http.Client();

  Future<void> createJuso(String token, String pack) async {
    try {
      http.Response response;
      Uri uri = Uri.parse(jusoBaseUrl);
      response = await _client.post(
        uri,
        body: {
          'token': token,
          'mode': 'p',
          'pack': pack,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('create juso api의 응답 코드가 200이 아닙니다.');
      }
      print(response.body);
      final json = jsonDecode(response.body);
      if (json['status'] != "1" && json['status'] != 1) {
        throw Exception(
            'create juso api의 결과 status가 1이 아닙니다. (status : ${json['status']})');
      }
    } catch (e) {}
  }

  Future<Result<List<JusoInfo>>> getJuso(String token) async {
    try {
      http.Response response;
      Uri uri = Uri.parse(jusoBaseUrl);
      response = await _client.post(
        uri,
        body: {
          'token': token,
          'mode': 'g',
        },
      );
      if (response.statusCode != 200) {
        throw Exception('get juso api의 응답 코드가 200이 아닙니다.');
      }
      print(response.body);
      final json = jsonDecode(response.body);
      if (json['status'] != "1" && json['status'] != 1) {
        throw Exception(
            'get juso api의 결과 status가 1이 아닙니다. (status : ${json['status']})');
      }

      Iterable jsonIterable = json['jlist'];
      final List<JusoInfo> jusoList =
          jsonIterable.map((e) => JusoInfo.fromJson(e)).toList();

      return Result.success(jusoList);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<void> deleteJuso(String token, String jid) async {
    try {
      http.Response response;
      Uri uri = Uri.parse(jusoBaseUrl);
      response = await _client.post(
        uri,
        body: {
          'token': token,
          'mode': 'd',
          'jid': jid,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('delete juso api의 응답 코드가 200이 아닙니다.');
      }
      print(response.body);
      final json = jsonDecode(response.body);
      if (json['status'] != "1" && json['status'] != 1) {
        throw Exception(
            'delete juso api의 결과 status가 1이 아닙니다. (status : ${json['status']})');
      }
    } catch (e) {}
  }

  Future<void> updateJuso(String token, String jid) async {
    try {
      http.Response response;
      Uri uri = Uri.parse(jusoBaseUrl);
      response = await _client.post(
        uri,
        body: {
          'token': token,
          'mode': 'u',
          'jid': jid,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('update juso api의 응답 코드가 200이 아닙니다.');
      }
      print(response.body);
      final json = jsonDecode(response.body);
      if (json['status'] != "1" && json['status'] != 1) {
        throw Exception(
            'update juso api의 결과 status가 1이 아닙니다. (status : ${json['status']})');
      }
    } catch (e) {}
  }
}
