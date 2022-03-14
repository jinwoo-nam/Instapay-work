import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';
import 'package:instapay_clone/domain/use_case/setting/delete_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_notice_data_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_setting_data_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/register_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/search_address_use_case.dart';
import 'package:instapay_clone/presentation/setting/setting_state.dart';

class SettingViewModel with ChangeNotifier {
  final GetSettingDataUseCase getSettingDataUseCase;
  final GetNoticeDataUseCase getNoticeDataUseCase;
  final SearchAddressUseCase searchAddressUseCase;
  final GetAddressUseCase getAddressUseCase;
  final RegisterAddressUseCase registerAddressUseCase;
  final DeleteAddressUseCase deleteAddressUseCase;

  SettingViewModel({
    required this.getSettingDataUseCase,
    required this.getNoticeDataUseCase,
    required this.searchAddressUseCase,
    required this.getAddressUseCase,
    required this.registerAddressUseCase,
    required this.deleteAddressUseCase,
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

  void setDefaultAddress(AddressData? address) {
    _state = state.copyWith(defaultAddress: address);
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
}
