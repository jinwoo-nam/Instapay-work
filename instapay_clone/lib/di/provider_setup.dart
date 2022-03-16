import 'package:instapay_clone/data/repository/my_wallet/add_bank_account_repository_impl.dart';
import 'package:instapay_clone/data/repository/my_wallet/delete_bank_account_repository_impl.dart';
import 'package:instapay_clone/data/repository/my_wallet/get_bank_account_repository_impl.dart';
import 'package:instapay_clone/data/repository/qr_pay/search_isbn_repository_impl.dart';
import 'package:instapay_clone/data/repository/setting/delete_address_repository_impl.dart';
import 'package:instapay_clone/data/repository/setting/get_address_repository_impl.dart';
import 'package:instapay_clone/data/repository/setting/register_address_repository_impl.dart';
import 'package:instapay_clone/data/repository/setting/search_address_repository_impl.dart';
import 'package:instapay_clone/data/repository/setting/setting_repository_impl.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/add_bank_account_use_case.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/delete_bank_account_use_case.dart';
import 'package:instapay_clone/domain/use_case/my_wallet/get_bank_account_use_case.dart';
import 'package:instapay_clone/domain/use_case/qr_pay/search_isbn_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/delete_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_notice_data_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_setting_data_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/register_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/search_address_use_case.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_view_model.dart';
import 'package:instapay_clone/presentation/qr_pay/qr_pay_view_model.dart';
import 'package:instapay_clone/presentation/root_page/root_view_model.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final settingRepository = SettingRepositoryImpl();
  final searchAddressRepository = SearchAddressRepositoryImpl();
  final getAddressRepository = GetAddressRepositoryImpl();
  final registerAddressRepository = RegisterAddressRepositoryImpl();
  final deleteAddressRepository = DeleteAddressRepositoryImpl();

  final getBankAccountRepository = GetBankAccountRepositoryImpl();
  final addBankAccountRepository = AddBankAccountRepositoryImpl();
  final deleteBankAccountRepository = DeleteBankAccountRepositoryImpl();

  final getBankAccountUseCase = GetBankAccountUseCase(getBankAccountRepository);
  final getAddressUseCase = GetAddressUseCase(getAddressRepository);
  final addBankAccountUseCase = AddBankAccountUseCase(addBankAccountRepository);
  final searchIsbnRepository = SearchISBNRepositoryImpl();

  return [
    ChangeNotifierProvider<RootViewModel>(
      create: (context) => RootViewModel(),
    ),
    ChangeNotifierProvider<MainScreenViewModel>(
      create: (context) => MainScreenViewModel(),
    ),
    ChangeNotifierProvider<MyWalletViewModel>(
      create: (context) => MyWalletViewModel(
        getBankAccountUseCase: getBankAccountUseCase,
        addBankAccountUseCase: addBankAccountUseCase,
        deleteBankAccountUseCase:
            DeleteBankAccountUseCase(deleteBankAccountRepository),
      ),
    ),
    ChangeNotifierProvider<SettingViewModel>(
      create: (context) => SettingViewModel(
        getSettingDataUseCase: GetSettingDataUseCase(settingRepository),
        getNoticeDataUseCase: GetNoticeDataUseCase(settingRepository),
        searchAddressUseCase: SearchAddressUseCase(searchAddressRepository),
        getAddressUseCase: getAddressUseCase,
        registerAddressUseCase:
            RegisterAddressUseCase(registerAddressRepository),
        deleteAddressUseCase: DeleteAddressUseCase(deleteAddressRepository),
      ),
    ),
    ChangeNotifierProvider<QrPayViewModel>(
      create: (context) => QrPayViewModel(
        getBankAccountUseCase: getBankAccountUseCase,
        getAddressUseCase: getAddressUseCase,
        addBankAccountUseCase: addBankAccountUseCase,
        searchIsbnUseCase: SearchIsbnUseCase(searchIsbnRepository),
      ),
    ),
  ];
}
