import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/my_wallet/means_data.dart';
import 'package:instapay_clone/domain/use_case/means/delete_means_use_cacse.dart';
import 'package:instapay_clone/domain/use_case/means/get_default_means_use_case.dart';
import 'package:instapay_clone/domain/use_case/means/get_means_use_case.dart';
import 'package:instapay_clone/domain/use_case/means/update_means_use_case.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/add_bank_account_use_case.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/delete_bank_account_use_case.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/get_bank_account_use_case.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_state.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_ui_event.dart';

class MyWalletViewModel with ChangeNotifier {
  final GetBankAccountUseCase getBankAccountUseCase;
  final AddBankAccountUseCase addBankAccountUseCase;
  final DeleteBankAccountUseCase deleteBankAccountUseCase;
  final GetMeansUseCase getMeansUseCase;
  final UpdateMeansUseCase updateMeansUseCase;
  final GetDefaultMeansUseCase getDefaultMeansUseCase;
  final DeleteMeansUseCase deleteMeansUseCase;

  MyWalletViewModel({
    required this.getBankAccountUseCase,
    required this.addBankAccountUseCase,
    required this.deleteBankAccountUseCase,
    required this.getMeansUseCase,
    required this.updateMeansUseCase,
    required this.getDefaultMeansUseCase,
    required this.deleteMeansUseCase,
  });

  MyWalletState _state = MyWalletState();

  MyWalletState get state => _state;

  final _eventController = StreamController<MyWalletUiEvent>.broadcast();

  Stream<MyWalletUiEvent> get eventStream => _eventController.stream;

  Future<void> fetchBankAccountData() async {
    final result = await getMeansUseCase();
    result.when(success: (meansList) {
      _state = state.copyWith(
        meansDataList: meansList,
      );
    }, error: (message) {
      print(message);
    });

    final defaultMeans = await getDefaultMeansUseCase();
    defaultMeans.when(
        success: (mid) {
          _state = state.copyWith(
            defaultMid: mid,
          );
        },
        error: (message) {});

    notifyListeners();
  }

  void setDefaultAccount(MeansData account) async {
    // await addBankAccountUseCase.addDefaultAccount(account);
    //
    // _state = state.copyWith(
    //   defaultAccount: account,
    // );
    //
    // _eventController.add(MyWalletUiEvent.changeDefaultAccount(account.title));
    await updateMeansUseCase(account.mid);
    notifyListeners();
  }

  void deleteBankAccountData(MeansData account) async {
    final result = await deleteMeansUseCase(account.mid);
    result.when(success: (res) {
      if (res == 'ok') {
        _eventController
            .add(const MyWalletUiEvent.showSnackBar('결제수단이 삭제 되었습니다.'));
      }
    }, error: (message) {
      print(message);
    });

    notifyListeners();
  }

  void setDeleteSelectedBankAccountData(MeansData data) {
    if (data.mname != 'INC') {
      _state = state.copyWith(deleteSelectAccount: data);
    } else {
      _state = state.copyWith(deleteSelectAccount: null);
    }

    notifyListeners();
  }

  void onDeleteButtonClick() {
    _state = state.copyWith(isSelectedDelete: !state.isSelectedDelete);
    notifyListeners();
  }
}
