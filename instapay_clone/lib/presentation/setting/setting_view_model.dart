import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';
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

    final addressList = await getAddressUseCase();
    addressList.when(
        success: (address) {
          _state = state.copyWith(addressList: address);
        },
        error: (message) {});

    if (state.defaultAddress == null && state.addressList.isNotEmpty) {
      setDefaultAddress(state.addressList[0]);
    }

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

  Future<void> searchAddress(String query) async {
    final result = await searchAddressUseCase(query);
    result.when(
        success: (address) {
          _state = state.copyWith(
            searchAddressList: address,
            isAddressSearchClicked: true,
          );
        },
        error: (message) {});

    notifyListeners();
  }

  void clearSearchAddressList() {
    _state = state.copyWith(
      searchAddressList: [],
      isAddressSearchClicked: false,
    );

    notifyListeners();
  }

  void registerAddress(AddressData address) async {
    await registerAddressUseCase(address);

    final addressList = await getAddressUseCase();
    addressList.when(
        success: (address) {
          _state = state.copyWith(addressList: address);
        },
        error: (message) {});

    notifyListeners();
  }

  void deleteAddress(AddressData address) async {
    await deleteAddressUseCase(address);

    final addressList = await getAddressUseCase();
    addressList.when(
        success: (address) {
          _state = state.copyWith(addressList: address);
        },
        error: (message) {});

    if (address == state.defaultAddress) {
      if (state.addressList.isNotEmpty) {
        setDefaultAddress(state.addressList[0]);
      } else {
        setDefaultAddress(null);
      }
    }

    notifyListeners();
  }

  void setDefaultAddress(AddressData? address) async {
    _state = state.copyWith(
      defaultAddress: address,
    );
    await registerAddressUseCase.setDefaultAddress(address);
    notifyListeners();
  }

  void clickAddressDelete() {
    _state = state.copyWith(
        addressDeleteEnable: !_state.addressDeleteEnable,
        deleteSelectedAddress: null);
    notifyListeners();
  }

  void setDeleteSelectedAddress(AddressData address) {
    _state = state.copyWith(deleteSelectedAddress: address);
    notifyListeners();
  }

  void clearAddressState() {
    _state = state.copyWith(deleteSelectedAddress: null);
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
}
