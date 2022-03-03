import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/setting/components/setting_list_data.dart';

class SettingViewModel with ChangeNotifier {
  final settingList = [
    SettingListData(title: '결제코드 변경',isTrailing: true),
    SettingListData(title: '주소지',isTrailing: true,subTitle: '등록된 주소지가 없습니다.'),
    SettingListData(title: '앱 정보',isTrailing: false,subTitle: '1.1.93-relase'),
    SettingListData(title: '공지 사항',isTrailing: true),
    SettingListData(title: '이용 약관',isTrailing: true),
    SettingListData(title: '문의하기',isTrailing: true),
    SettingListData(title: '서비스 해지',isTrailing: true),
  ];
}
