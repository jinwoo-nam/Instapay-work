import 'package:instapay_clone/domain/model/user_info/user_info_data.dart';

abstract class UserInfoRepository {
  UserInfoData getUserInfo();

  void setUserEmail(String email);

  void setUserName(String name);
}
