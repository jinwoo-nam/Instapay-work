import 'dart:convert';

import 'package:instapay_clone/domain/model/setting/juso_info.dart';
import 'package:instapay_clone/domain/repository/juso/juso_repository.dart';
import 'package:instapay_clone/domain/repository/local/login_info_repository.dart';

class CreateJusoUseCase {
  final LoginInfoRepository loginInfoRepository;
  final JusoRepository jusoRepository;

  CreateJusoUseCase({
    required this.loginInfoRepository,
    required this.jusoRepository,
  });

  Future<void> call(JusoInfo info) async {
    final obj = {
      'jtitle': info.jtitle,
      'zip': info.zip,
      'fixed': info.fixed,
      'user': info.user,
      'tel': info.tel,
    };

    final json = jsonEncode(obj);
    String pack = base64.encode(utf8.encode(json));
    String token = await loginInfoRepository.loadAccessToken();
    print('pack:$pack');
    print('token:$token');
    return await jusoRepository.createJuso(token, pack);
  }
}
