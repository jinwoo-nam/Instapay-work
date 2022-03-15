import 'package:instapay_clone/data/data_source/my_wallet/get_bank_account_data_source.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';

class AddBankAccountDataSource {
  Future<void> addBankAccount(BankAccountData account) async {
    try {
      bankAccountList.add(account);
    } on Exception {}
  }

  Future<void> addDefaultAccount(BankAccountData? account) async {
    try {
      defaultAccount = account;
    } on Exception {}
  }
}
