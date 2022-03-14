import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/data/data_source/my_wallet/get_bank_account_data_source.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:instapay_clone/domain/repository/my_wallet/get_bank_account_repository.dart';

class GetBankAccountRepositoryImpl implements GetBankAccountRepository {
  final _dataSource = GetBankAccountDataSource();

  @override
  Future<Result<List<BankAccountData>>> getBankAccount() async {
    return await _dataSource.getBankAccountList();
  }
}
