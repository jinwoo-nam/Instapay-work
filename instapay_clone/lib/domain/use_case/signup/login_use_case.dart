import 'dart:convert';

import 'package:instapay_clone/domain/repository/local/login_info_repository.dart';
import 'package:instapay_clone/domain/repository/local/login_pack_repository.dart';
import 'package:instapay_clone/domain/repository/signup/signup_repository.dart';
import 'package:instapay_clone/util/util_encode.dart';

class LoginUseCase {
  SignupRepository repository;
  LoginInfoRepository loginInfoRepository;
  LoginPackRepository loginPackRepository;

  LoginUseCase({
    required this.repository,
    required this.loginInfoRepository,
    required this.loginPackRepository,
  });

  Future<String> call(String email, String uuid, String bpxlUuid,
      double latitude, double longitude,
      {bool isEmailCheck = false}) async {
    final obj = {
      'email': email,
      'uuida': uuid,
      'uuidb': bpxlUuid,
      'latitude': latitude,
      'longtitude': longitude,
    };
    final json = jsonEncode(obj);
    final String pack = _makePack(json);
    await loginPackRepository.savePack(pack);

    String apiResult = '';
    String pack_h;
    String salt = await loginInfoRepository.loadSalt();
    //test
    //salt = 'o20holr15p04o0611z54g10wp';
    //
    if (salt.isEmpty) {
      pack_h = _makePackH(pack);
    } else {
      pack_h = _makePackH(pack, key: salt);
    }
    const String aid = 'n20mn-lz22g-10t31-15t36-y24oa';

    print('aid: $aid, pack: $pack, pack_h: $pack_h');

    final res = await repository.login(aid, pack, pack_h);
    res.when(success: (loginResult) {
      loginInfoRepository.saveAccessToken(loginResult.token);
      loginInfoRepository.saveSalt(loginResult.salt);
      apiResult = loginResult.result;
    }, error: (message) {
      print(message);
    });

    return apiResult;
  }

  Future<String> socialLogin(
      String email,
      String uuid,
      String bpxlUuid,
      double latitude,
      double longitude,
      String loginType,
      String idToken) async {
    final Map<String, dynamic> obj = makeLoginInfoObj(
        email, uuid, bpxlUuid, latitude, longitude, loginType, idToken);
    print(obj);
    final json = jsonEncode(obj);
    final String pack = _makePack(json);
    await loginPackRepository.savePack(pack);

    String apiResult = '';
    String pack_h;
    String salt = await loginInfoRepository.loadSalt();
    //test
    salt = 'o20holr15p04o0611z54g10wp';

    if (salt.isEmpty) {
      pack_h = _makePackH(pack);
    } else {
      pack_h = _makePackH(pack, key: salt);
    }
    const String aid = 'n20mn-lz22g-10t31-15t36-y24oa';

    print('aid: $aid, pack: $pack, pack_h: $pack_h');

    final res = await repository.login(aid, pack, pack_h);
    res.when(success: (loginResult) {
      loginInfoRepository.saveAccessToken(loginResult.token);
      loginInfoRepository.saveSalt(loginResult.salt);
      apiResult = loginResult.result;
    }, error: (message) {
      print(message);
    });

    return apiResult;
  }

  Future<Map<String, dynamic>> autoLogin() async {
    String pack = await loginPackRepository.loadPack();
    String salt = await loginInfoRepository.loadSalt();
    String pack_h;
    String apiResult = '';
    String email = '';
    if (salt.isEmpty) {
      pack_h = _makePackH(pack);
    } else {
      pack_h = _makePackH(pack, key: salt);
    }
    const String aid = 'n20mn-lz22g-10t31-15t36-y24oa';

    print('aid: $aid, pack: $pack, pack_h: $pack_h');

    final res = await repository.login(aid, pack, pack_h);
    res.when(success: (loginResult) {
      loginInfoRepository.saveAccessToken(loginResult.token);
      loginInfoRepository.saveSalt(loginResult.salt);
      apiResult = loginResult.result;
      email = loginResult.email;
    }, error: (message) {
      print(message);
    });

    return {
      'result': apiResult,
      'email': email,
    };
  }

  String _makePack(String json) {
    //zlib inflate(rfc 1951) + base64
    return zLibInflate(json);
  }

  String _makePackH(String pack, {String key = 'o20holr15p04o0611z54g10wp'}) {
    //sha1 Hmac
    return sha1HmacEncode(pack, key);
  }

  Map<String, dynamic> makeLoginInfoObj(
      String email,
      String uuid,
      String bpxlUuid,
      double latitude,
      double longitude,
      String loginType,
      String idToken) {
    switch (loginType) {
      case 'google':
        return {
          'email': email,
          'uuida': uuid,
          'uuidb': bpxlUuid,
          'latitude': latitude,
          'longtitude': longitude,
          'idtoken': idToken,
        };
      case 'naver':
        return {
          'email': email,
          'uuida': uuid,
          'uuidb': bpxlUuid,
          'latitude': latitude,
          'longtitude': longitude,
          'nToken': idToken,
        };
      case 'apple':
        return {
          'email': email,
          'uuida': uuid,
          'uuidb': bpxlUuid,
          'latitude': latitude,
          'longtitude': longitude,
          'atoken': idToken,
        };
      default:
        return {
          'email': email,
          'uuida': uuid,
          'uuidb': bpxlUuid,
          'latitude': latitude,
          'longtitude': longitude,
        };
    }
  }
}
