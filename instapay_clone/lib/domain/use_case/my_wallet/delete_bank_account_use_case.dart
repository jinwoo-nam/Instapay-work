import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:instapay_clone/domain/repository/my_wallet/delete_bank_account_repository.dart';

class DeleteBankAccountUseCase {
  DeleteBankAccountRepository repository;

  DeleteBankAccountUseCase(this.repository);

  Future<void> call(BankAccountData account) async {
    await repository.deleteBankAccount(account);
  }
}
