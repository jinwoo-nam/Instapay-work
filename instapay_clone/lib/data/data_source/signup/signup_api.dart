import 'package:http/http.dart' as http;
import 'package:instapay_clone/core/result.dart';

class SignupApi {
  static String mLoginBaseUrl = 'https://api.instapay.kr/v3/mlogin';
  final http.Client _client = http.Client();

  Future<Result<Map>> login(String aid, String pack, String pack_h) async {
    try {
      http.Response response;

      response = await _client.post(
        Uri.parse(mLoginBaseUrl),
        body: {'aid': aid, 'pack': pack, 'pack_h': pack_h},
      );
      print(response);
      //Dio Test
      // Response response;
      // var dio = Dio();
      // var formData = FormData.fromMap(
      //   {'aid': aid, 'pack': pack, 'pack_h': pack_h},
      // );
      // response = await dio.post(
      //   mLoginBaseUrl,
      //   data: formData,
      // );
      // print(response.data);
      return Result.success({});
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
