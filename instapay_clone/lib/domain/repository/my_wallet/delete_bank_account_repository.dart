import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';

abstract class DeleteBankAccountRepository {
  Future<void> deleteBankAccount(BankAccountData account);
}