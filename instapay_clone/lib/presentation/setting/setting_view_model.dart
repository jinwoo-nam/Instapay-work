import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/setting/juso_info.dart';
import 'package:instapay_clone/domain/use_case/juso/create_juso_use_case.dart';
import 'package:instapay_clone/domain/use_case/juso/delete_juso_use_case.dart';
import 'package:instapay_clone/domain/use_case/juso/get_jip_zip_use_case.dart';
import 'package:instapay_clone/domain/use_case/juso/get_juso_use_case.dart';
import 'package:instapay_clone/domain/use_case/local/login_info_use_case.dart';
import 'package:instapay_clone/domain/use_case/local/pin_code_use_case.dart';
import 'package:instapay_clone/domain/use_case/quest/question_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/delete_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_notice_data_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_setting_data_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/register_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/search_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/signup/key_use_case.dart';
import 'package:instapay_clone/presentation/setting/setting_state.dart';
import 'package:instapay_clone/util/util.dart';

import '../../domain/use_case/juso/update_juso_use_case.dart';
import '../../domain/use_case/user_info/user_info_use_case.dart';

class SettingViewModel with ChangeNotifier {
  final GetSettingDataUseCase getSettingDataUseCase;
  final GetNoticeDataUseCase getNoticeDataUseCase;
  final SearchAddressUseCase searchAddressUseCase;
  final GetAddressUseCase getAddressUseCase;
  final RegisterAddressUseCase registerAddressUseCase;
  final DeleteAddressUseCase deleteAddressUseCase;
  final PinCodeUseCase pinCodeUseCase;
  final LoginInfoUseCase loginInfoUseCase;
  final KeyUseCase keyUseCase;
  final QuestionUseCase questionUseCase;
  final GetJusoUseCase getJusoUseCase;
  final CreateJusoUseCase createJusoUseCase;
  final DeleteJusoUseCase deleteJusoUseCase;
  final UpdateJusoUseCase updateJusoUseCase;
  final GetJipZipUseCase getJipZipUseCase;
  final UserInfoUseCase userInfoUseCase;

  SettingViewModel({
    required this.getSettingDataUseCase,
    required this.getNoticeDataUseCase,
    required this.searchAddressUseCase,
    required this.getAddressUseCase,
    required this.registerAddressUseCase,
    required this.deleteAddressUseCase,
    required this.pinCodeUseCase,
    required this.loginInfoUseCase,
    required this.keyUseCase,
    required this.questionUseCase,
    required this.getJusoUseCase,
    required this.createJusoUseCase,
    required this.deleteJusoUseCase,
    required this.updateJusoUseCase,
    required this.getJipZipUseCase,
    required this.userInfoUseCase,
  }) {
    fetchSettingData();
  }

  SettingState _state = SettingState();

  SettingState get state => _state;

  void fetchSettingData() async {
    final noticeList = await getNoticeDataUseCase.getNoticeListData();
    noticeList.when(
        success: (notice) {
          _state = state.copyWith(noticeList: notice);
        },
        error: (message) {});

    await getJuso();

    final addressList = await getAddressUseCase();
    addressList.when(
        success: (address) {
          // _state = state.copyWith(addressList: address);
        },
        error: (message) {});

    // if (state.defaultAddress == null && state.addressList.isNotEmpty) {
    //   setDefaultAddress(state.Juso[0]);
    // }

    final settingList = await getSettingDataUseCase.getSettingListData();
    final termsOfUse = await getSettingDataUseCase.getTermsOfUseListData();
    final reason =
        await getSettingDataUseCase.getServiceTerminationReasonData();
    _state = state.copyWith(
      settingList: settingList,
      termsOfUseList: termsOfUse,
      reasonList: reason,
    );

    notifyListeners();
  }

  void getUserInfo() {
    final userInfo = userInfoUseCase.getUserInfo();
    _state = state.copyWith(
      userEmail: userInfo.email,
      userName: userInfo.name.isEmpty ? '실명 인증 전입니다.' : userInfo.name,
    );
    notifyListeners();
  }

  void clearSearchAddressList() {
    _state = state.copyWith(
      // searchAddressList: [],
      isAddressSearchClicked: false,
    );

    notifyListeners();
  }

  void clickAddressDelete() {
    _state = state.copyWith(
        addressDeleteEnable: !_state.addressDeleteEnable,
        deleteSelectedJuso: null);
    notifyListeners();
  }

  void setDeleteSelectedAddress(JusoInfo juso) {
    _state = state.copyWith(deleteSelectedJuso: juso);
    notifyListeners();
  }

  void clearAddressState() {
    _state = state.copyWith(deleteSelectedJuso: null);
    _state = state.copyWith(addressDeleteEnable: false);
    notifyListeners();
  }

  Future<void> savePinCode(String pinCode) async {
    await pinCodeUseCase.savePinCode(pinCode);
  }

  Future<String> getPinCode() async {
    return await pinCodeUseCase.loadPinCode();
  }

  Future<String> getToken() async {
    return await loginInfoUseCase.loadAccessToken();
  }

  Future<String> getSalt() async {
    return await loginInfoUseCase.loadSalt();
  }

  Future<LoginResult> keyRegister(String pinCode) async {
    String token = await getToken();
    String salt = await getSalt();

    final result = await keyUseCase.call(token, salt, pinCode);

    switch (result) {
      case 'email':
        //이메일 인증 미완료
        return LoginResult.email;
      case 'pin':
        //이메일 인증 완료, pin code 등록 필요
        return LoginResult.pin;
      case 'ok':
        //이메일 인증 완료, pin code 등록 완료
        return LoginResult.ok;
      default:
        return LoginResult.none;
    }
  }

  Future<bool> sendQuestion(String sub, String msg) async {
    bool result = false;
    final res = await questionUseCase(sub, msg);
    res.when(success: (data) {
      if (data == 'ok') {
        result = true;
      }
    }, error: (message) {
      print(message);
    });

    return result;
  }

  Future<void> getJuso() async {
    final result = await getJusoUseCase();
    result.when(success: (jusoList) {
      _state = state.copyWith(
        jusoList: jusoList,
        defaultJuso: (jusoList.isEmpty) ? null : jusoList.first,
      );
    }, error: (message) {
      print(message);
    });

    notifyListeners();
  }

  Future<void> createJuso(JusoInfo info) async {
    await createJusoUseCase(info);
    await getJuso();
  }

  Future<void> deleteJuso(String jid) async {
    await deleteJusoUseCase(jid);
    _state = state.copyWith(
        addressDeleteEnable: !_state.addressDeleteEnable,
        deleteSelectedJuso: null);
    await getJuso();
  }

  Future<void> updateJuso(JusoInfo info) async {
    await updateJusoUseCase(info.jid);

    await getJuso();
  }

  Future<void> searchAddress(String query) async {
    _state = state.copyWith(
      isSearchLoading: true,
    );
    notifyListeners();

    final zipResult = await getJipZipUseCase.getZip(query);
    zipResult.when(
      success: (jusoList) {
        _state = state.copyWith(
          searchJusoResultList: jusoList,
          isAddressSearchClicked: true,
          isSearchLoading: false,
        );
      },
      error: (message) {
        print(message);
      },
    );

    notifyListeners();
  }
}
