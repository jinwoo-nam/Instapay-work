import 'dart:convert';

import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/juso_search_result_data.dart';
import 'package:instapay_clone/domain/repository/juso/jip_zip_repository.dart';
import 'package:instapay_clone/domain/repository/local/login_info_repository.dart';

class GetJipZipUseCase {
  final LoginInfoRepository loginInfoRepository;
  final JipZipRepository jipZipRepository;

  GetJipZipUseCase({
    required this.loginInfoRepository,
    required this.jipZipRepository,
  });

  Future<void> getJip(String address) async {
    String token = await loginInfoRepository.loadAccessToken();

    String jip = base64.encode(utf8.encode(address));
    await jipZipRepository.getJip(token, jip);
  }

  Future<Result<List<JusoSearchResultData>>> getZip(String address) async {
    String token = await loginInfoRepository.loadAccessToken();

    return await jipZipRepository.getZip(token, address);
  }
}
