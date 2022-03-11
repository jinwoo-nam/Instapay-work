import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';
import 'package:instapay_clone/domain/model/setting/notice_list_data.dart';
import 'package:instapay_clone/domain/model/setting/service_termination_reason_data.dart';
import 'package:instapay_clone/domain/model/setting/setting_list_data.dart';
import 'package:instapay_clone/domain/model/setting/terms_of_use_list_data.dart';


part 'setting_state.freezed.dart';

part 'setting_state.g.dart';

@freezed
class SettingState with _$SettingState {
  factory SettingState({
    @Default([]) List<NoticeListData> noticeList,
    @Default([]) List<SettingListData> settingList,
    @Default([]) List<TermsOfUseListData> termsOfUseList,
    @Default([]) List<ServiceTerminationReasonData> reasonList,
    @Default([]) List<AddressData> searchAddressList,
    @Default([]) List<AddressData> addressList,
    @Default(false) isSearch,
  }) = _SettingState;

  factory SettingState.fromJson(Map<String, dynamic> json) =>
      _$SettingStateFromJson(json);
}
