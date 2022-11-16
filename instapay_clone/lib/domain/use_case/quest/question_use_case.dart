import 'dart:convert';

import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/repository/local/login_info_repository.dart';
import 'package:instapay_clone/domain/repository/quest/question_repository.dart';

class QuestionUseCase {
  final LoginInfoRepository loginInfoRepository;
  final QuestionRepository questionRepository;

  QuestionUseCase({
    required this.loginInfoRepository,
    required this.questionRepository,
  });

  Future<Result<String>> call(String sub, String msg) async {
    String token = await loginInfoRepository.loadAccessToken();
    final subBase64 = base64Encode(utf8.encode(sub));
    final msgBase64 = base64Encode(utf8.encode(msg));
    return await questionRepository.questionApi(token, subBase64, msgBase64);
  }
}
