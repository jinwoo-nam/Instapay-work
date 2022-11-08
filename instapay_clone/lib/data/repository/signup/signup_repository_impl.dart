import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/data/data_source/signup/signup_api.dart';
import 'package:instapay_clone/domain/repository/signup/signup_repository.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupApi _dataSource;

  SignupRepositoryImpl(this._dataSource);

  @override
  Future<Result<Map>> login(String aid, String pack, String pack_h) async {
    return await _dataSource.login(aid, pack, pack_h);
  }
}
