import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/add_bank_account_use_case.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/delete_bank_account_use_case.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/get_bank_account_use_case.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_state.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_ui_event.dart';

class MyWalletViewModel with ChangeNotifier {
  final GetBankAccountUseCase getBankAccountUseCase;
  final AddBankAccountUseCase addBankAccountUseCase;
  final DeleteBankAccountUseCase deleteBankAccountUseCase;

  MyWalletViewModel({
    required this.getBankAccountUseCase,
    required this.addBankAccountUseCase,
    required this.deleteBankAccountUseCase,
  }) {
    fetchBankAccountData();
  }

  MyWalletState _state = MyWalletState();

  MyWalletState get state => _state;

  final _eventController = StreamController<MyWalletUiEvent>.broadcast();

  Stream<MyWalletUiEvent> get eventStream => _eventController.stream;

  void fetchBankAccountData() async {
    final accountList = await getBankAccountUseCase();
    accountList.when(
        success: (list) {
          _state = state.copyWith(
            accountList: list,
            defaultAccount: list[0],
          );
        },
        error: (message) {});

    notifyListeners();
  }

  void addBankAccountData(BankAccountData account) async {
    await addBankAccountUseCase(account);

    final accountList = await getBankAccountUseCase();
    accountList.when(
        success: (list) {
          _state = state.copyWith(
            accountList: list,
          );
        },
        error: (message) {});

    notifyListeners();
  }

  void setDefaultAccount(BankAccountData account) async {
    await addBankAccountUseCase.addDefaultAccount(account);

    _state = state.copyWith(
      defaultAccount: account,
    );

    _eventController.add(MyWalletUiEvent.changeDefaultAccount(account.title));
    notifyListeners();
  }

  void deleteBankAccountData(BankAccountData account) async {
    await deleteBankAccountUseCase(account);
    _eventController.add(const MyWalletUiEvent.showSnackBar('결제수단이 삭제 되었습니다.'));

    final accountList = await getBankAccountUseCase();
    accountList.when(
        success: (list) {
          _state = state.copyWith(accountList: list);
        },
        error: (message) {});

    notifyListeners();
  }

  void setDeleteSelectedBankAccountData(BankAccountData account) {
    if (account.title != '인스타코인') {
      _state = state.copyWith(deleteSelectAccount: account);
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
