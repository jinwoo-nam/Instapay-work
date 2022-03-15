import 'package:instapay_clone/data/data_source/my_wallet/add_bank_account_data_source.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:instapay_clone/domain/repository/my_wallet/add_bank_account_repository.dart';

class AddBankAccountRepositoryImpl implements AddBankAccountRepository {
  final _dataSource = AddBankAccountDataSource();

  @override
  Future<void> addBankAccount(BankAccountData account) async {
    await _dataSource.addBankAccount(account);
  }

  @override
  Future<void> addDefaultAccount(BankAccountData? account) async{
    await _dataSource.addDefaultAccount(account);
  }
}
