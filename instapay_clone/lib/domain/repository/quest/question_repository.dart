import 'package:instapay_clone/core/result.dart';

abstract class QuestionRepository {
  Future<Result<String>> questionApi(String token, String sub, String msg);
}
