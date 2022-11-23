import 'package:instapay_clone/data/data_source/user_info/user_info_in_memory_data_source.dart';
import 'package:instapay_clone/domain/model/user_info/user_info_data.dart';
import 'package:instapay_clone/domain/repository/user_info/user_info_repository.dart';

class UserInfoRepositoryImpl extends UserInfoRepository {
  final UserInfoInMemoryDataSource _dataSource = UserInfoInMemoryDataSource();

  @override
  UserInfoData getUserInfo() {
    return _dataSource.getUserInfo();
  }

  @override
  void setUserEmail(String email) {
    _dataSource.setUserEmail(email);
  }

  @override
  void setUserName(String name) {
    _dataSource.setUserName(name);
  }
}
