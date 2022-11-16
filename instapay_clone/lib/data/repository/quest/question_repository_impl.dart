import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/data/data_source/quest/question_api.dart';
import 'package:instapay_clone/domain/repository/quest/question_repository.dart';

class QuestionRepositoryImpl extends QuestionRepository {
  final QuestionApi _dataSource = QuestionApi();

  @override
  Future<Result<String>> questionApi(String token, String sub, String msg) async {
    return await _dataSource.questionApi(token, sub, msg);
  }
}
