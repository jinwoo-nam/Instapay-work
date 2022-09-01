import 'package:instapay_clone/data/data_source/my_wallet/delete_bank_account_data_source.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:instapay_clone/domain/repository/my_wallet/delete_bank_account_repository.dart';

class DeleteBankAccountRepositoryImpl implements DeleteBankAccountRepository {
  final _dataSource = DeleteBankAccountDataSource();

  @override
  Future<bool> deleteBankAccount(BankAccountData? account) async {
    return await _dataSource.deleteBankAccount(account);
  }
}
