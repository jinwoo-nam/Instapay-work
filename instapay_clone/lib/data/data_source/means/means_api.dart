import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/my_wallet/means_data.dart';

class MeansApi {
  static String meansBaseUrl = 'https://api.instapay.kr/v3/means';

  final http.Client _client = http.Client();

  Future<Result<List<MeansData>>> getMeans(String token) async {
    try {
      http.Response response;
      Uri uri = Uri.parse(meansBaseUrl);
      response = await _client.post(
        uri,
        body: {
          'token': token,
          'mode': 'l',
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
      Iterable jsonIterable = json['means'];
      final List<MeansData> meansData =
          jsonIterable.map((e) => MeansData.fromJson(e)).toList();

      return Result.success(meansData);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<void> updateMeans(String token, String mid) async {
    try {
      http.Response response;
      Uri uri = Uri.parse(meansBaseUrl);
      response = await _client.post(
        uri,
        body: {
          'token': token,
          'mode': 'u',
          'mid': mid,
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
    } catch (e) {
      //return Result.error(e.toString());
    }
  }

  Future<Result<String>> getDefaultMeans(String token) async {
    try {
      http.Response response;
      Uri uri = Uri.parse(meansBaseUrl);
      response = await _client.post(
        uri,
        body: {
          'token': token,
          'mode': 'g',
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

      return Result.success(json['mid']);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<String>> deleteMeans(String token, String mid) async {
    try {
      http.Response response;
      Uri uri = Uri.parse(meansBaseUrl);
      response = await _client.post(
        uri,
        body: {
          'token': token,
          'mode': 'd',
          'mid': mid,
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

      return Result.success(json['result']);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
