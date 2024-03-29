import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';

class GetBankAccountDataSource {
  Future<Result<List<BankAccountData>>> getBankAccountList() async {
    try {
      return Result.success(bankAccountList);
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<BankAccountData?>> getDefaultAccountList() async {
    try {
      return Result.success(defaultAccount);
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }
}

List<BankAccountData> bankAccountList = [
  BankAccountData(
    title: '인스타코인',
    balance: 5,
    unit: 'INC'
  ),
];

BankAccountData? defaultAccount = bankAccountList[0];