import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/sign_up/login_result_data.dart';

abstract class SignupRepository {
  Future<Result<LoginResultData>> login(String aid, String pack, String pack_h);
}
