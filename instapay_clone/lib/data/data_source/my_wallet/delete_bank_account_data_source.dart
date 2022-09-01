import 'package:instapay_clone/data/data_source/my_wallet/get_bank_account_data_source.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';

class DeleteBankAccountDataSource {
  Future<bool> deleteBankAccount(BankAccountData? account) async {
    try {
      if (account != null && bankAccountList.contains(account)) {
        bankAccountList.remove(account);
        return true;
      }
    } on Exception {}

    return false;
  }
}
