import 'dart:convert';

import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/sign_up/login_result_data.dart';
import 'package:instapay_clone/domain/repository/signup/signup_repository.dart';
import 'package:instapay_clone/util/util_encode.dart';

class LoginUseCase {
  SignupRepository repository;

  LoginUseCase(this.repository);

  Future<Result<LoginResultData>> call(String email, String uuid, String bpxlUuid,
      double latitude, double longitude) async {
    final obj = {
      'email': email,
      'uuida': uuid,
      'uuidb': bpxlUuid,
      'latitude': latitude,
      'longtitude': longitude,
    };
    final json = jsonEncode(obj);
    final String pack = _makePack(json);
    final String pack_h = _makePackH(pack);
    const String aid = 'n20mn-lz22g-10t31-15t36-y24oa';

    print('aid: $aid, pack: $pack, pack_h: $pack_h');
    final res = await repository.login(aid, pack, pack_h);
    return res;
  }

  String _makePack(String json) {
    //zlib inflate(rfc 1951) + base64
    return zLibInflate(json);
  }

  String _makePackH(String pack, {String key = 'o20holr15p04o0611z54g10wp'}) {
    //sha1 Hmac
    return sha1HmacEncode(pack, key);
  }
}
