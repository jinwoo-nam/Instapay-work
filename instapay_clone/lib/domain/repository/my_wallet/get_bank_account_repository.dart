import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';

abstract class GetBankAccountRepository {
  Future<Result<List<BankAccountData>>> getBankAccount();
}