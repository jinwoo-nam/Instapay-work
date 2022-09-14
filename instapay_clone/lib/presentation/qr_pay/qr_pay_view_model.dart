import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:instapay_clone/domain/model/qr_pay/book_order_data.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/add_bank_account_use_case.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/get_bank_account_use_case.dart';
import 'package:instapay_clone/domain/use_case/qr_pay/search_isbn_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_address_use_case.dart';
import 'package:instapay_clone/presentation/qr_pay/qr_pay_state.dart';

class QrPayViewModel with ChangeNotifier {
  final GetBankAccountUseCase getBankAccountUseCase;
  final GetAddressUseCase getAddressUseCase;
  final AddBankAccountUseCase addBankAccountUseCase;
  final SearchIsbnUseCase searchIsbnUseCase;

  QrPayViewModel({
    required this.getBankAccountUseCase,
    required this.getAddressUseCase,
    required this.addBankAccountUseCase,
    required this.searchIsbnUseCase,
  });

  QrPayState _state = QrPayState();

  QrPayState get state => _state;

  Future<void> fetchBankAccountData() async {
    final accountList = await getBankAccountUseCase();
    final defaultAccount = await getBankAccountUseCase.getDefaultAccount();
    accountList.when(
        success: (list) {
          _state = state.copyWith(accountList: list);
        },
        error: (message) {});

    defaultAccount.when(
        success: (account) {
          if (account == null) {
            _state = state.copyWith(defaultAccount: state.accountList[0]);
          } else {
            _state = state.copyWith(defaultAccount: account);
          }
        },
        error: (message) {});

    notifyListeners();
  }

  Future<void> fetchDefaultAddress() async {
    final result = await getAddressUseCase.getDefaultAddress();
    result.when(
        success: (address) {
          _state = state.copyWith(
            defaultAddress: address,
          );
        },
        error: (message) {});
    notifyListeners();
  }

  void setDefaultBankAccount(BankAccountData account) async {
    await addBankAccountUseCase.addDefaultAccount(account);
    _state = state.copyWith(
      defaultAccount: account,
    );
    notifyListeners();
  }

  void addBankAccountData(BankAccountData account) async {
    await addBankAccountUseCase(account);
    await addBankAccountUseCase.addDefaultAccount(account);
    final accountList = await getBankAccountUseCase();
    accountList.when(
        success: (list) {
          _state = state.copyWith(
            accountList: list,
            defaultAccount: account,
          );
        },
        error: (message) {});

    notifyListeners();
  }

  Future<BookOrderData?> searchISBN(String isbn) async {
    BookOrderData? data;
    final result = await searchIsbnUseCase(isbn);
    result.when(
        success: (bookData) {
          data = bookData;
          _state = state.copyWith(
            bookOrderData: bookData,
          );
        },
        error: (message) {});
    //notifyListeners();
    return data;
  }
}
