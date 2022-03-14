import 'package:instapay_clone/data/data_source/my_wallet/get_bank_account_data_source.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';

class DeleteBankAccountDataSource {
  Future<void> deleteBankAccount(BankAccountData account) async {
    try {
      bankAccountList.remove(account);
    } on Exception {}
  }
}
