import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/setting_list_data.dart';

class SettingViewModel with ChangeNotifier {
  final settingList = [
    SettingListData(title: '결제코드 변경',isTrailing: true,type: SettingType.paymentCodeChange),
    SettingListData(title: '주소지',isTrailing: true,type: SettingType.address,subTitle: '등록된 주소지가 없습니다.'),
    SettingListData(title: '앱 정보',isTrailing: false,type: SettingType.appVersion,subTitle: '1.1.93-relase'),
    SettingListData(title: '공지 사항',isTrailing: true,type: SettingType.notice),
    SettingListData(title: '이용 약관',isTrailing: true,type: SettingType.termsOfUse),
    SettingListData(title: '문의하기',isTrailing: true,type: SettingType.inquiry),
    SettingListData(title: '서비스 해지',isTrailing: true,type: SettingType.serviceTermination),
  ];
}
