import 'package:instapay_clone/domain/model/user_info/user_info_data.dart';

class UserInfoInMemoryDataSource {
  UserInfoData getUserInfo() {
    return userInfo;
  }

  void setUserEmail(String email) {
    userInfo = userInfo.copyWith(
      email: email,
    );
  }

  void setUserName(String name) {
    userInfo = userInfo.copyWith(
      name: name,
    );
  }
}

UserInfoData userInfo = UserInfoData(
  email: '',
  name: '',
);
