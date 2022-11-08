import 'package:instapay_clone/core/result.dart';

abstract class SignupRepository {
  Future<Result<Map>> login(String aid, String pack, String pack_h);
}
