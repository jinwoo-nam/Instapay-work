import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';

abstract class AddBankAccountRepository {
  Future<void> addBankAccount(BankAccountData account);
}