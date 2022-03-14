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
}

List<BankAccountData> bankAccountList = [
  BankAccountData(
    title: 'INC',
    balance: 0,
  ),
  BankAccountData(
    title: 'Deposit',
    balance: 0,
    unit: 'KRW',
  ),
  BankAccountData(
    title: 'Ethereum',
    balance: 0,
    unit: 'ETH',
  ),
];
