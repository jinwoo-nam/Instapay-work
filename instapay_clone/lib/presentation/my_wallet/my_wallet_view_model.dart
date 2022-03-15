import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/add_bank_account_use_case.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/delete_bank_account_use_case.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/get_bank_account_use_case.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_state.dart';

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

  void fetchBankAccountData() async {
    final accountList = await getBankAccountUseCase();
    accountList.when(
        success: (list) {
          _state = state.copyWith(accountList: list);
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
    notifyListeners();
  }

  void deleteBankAccountData(BankAccountData account) async {
    await deleteBankAccountUseCase(account);

    final accountList = await getBankAccountUseCase();
    accountList.when(
        success: (list) {
          _state = state.copyWith(accountList: list);
        },
        error: (message) {});

    notifyListeners();
  }

  void setDeleteSelectedBankAccountData(BankAccountData account) {
    _state = state.copyWith(deleteSelectAccount: account);
    notifyListeners();
  }

  void onDeleteButtonClick() {
    _state = state.copyWith(isSelectedDelete: !state.isSelectedDelete);
    notifyListeners();
  }
}
