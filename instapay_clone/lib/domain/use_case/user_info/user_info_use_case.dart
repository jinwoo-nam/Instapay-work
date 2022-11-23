import 'package:instapay_clone/domain/model/user_info/user_info_data.dart';
import 'package:instapay_clone/domain/repository/user_info/user_info_repository.dart';

class UserInfoUseCase {
  final UserInfoRepository userInfoRepository;

  UserInfoUseCase({
    required this.userInfoRepository,
  });

  UserInfoData getUserInfo() {
    return userInfoRepository.getUserInfo();
  }

  void setUserEmail(String email) {
    userInfoRepository.setUserEmail(email);
  }

  void setUserName(String name) {
    userInfoRepository.setUserName(name);
  }
}
