import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:instapay_clone/domain/repository/my_wallet/add_bank_account_repository.dart';

class AddBankAccountUseCase {
  AddBankAccountRepository repository;

  AddBankAccountUseCase(this.repository);

  Future<void> call(BankAccountData account) async {
    await repository.addBankAccount(account);
  }
}
