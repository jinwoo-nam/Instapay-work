import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:instapay_clone/domain/repository/my_wallet/get_bank_account_repository.dart';

class GetBankAccountUseCase {
  GetBankAccountRepository repository;

  GetBankAccountUseCase(this.repository);

  Future<Result<List<BankAccountData>>> call() async {
    return await repository.getBankAccount();
  }

  Future<Result<BankAccountData?>> getDefaultAccount() async {
    return await repository.getDefaultAccount();
  }

}
