import 'package:instapay_clone/data/repository/setting/delete_address_repository_impl.dart';
import 'package:instapay_clone/data/repository/setting/get_address_repository_impl.dart';
import 'package:instapay_clone/data/repository/setting/register_address_repository_impl.dart';
import 'package:instapay_clone/data/repository/setting/search_address_repository_impl.dart';
import 'package:instapay_clone/data/repository/setting/setting_repository_impl.dart';
import 'package:instapay_clone/domain/use_case/setting/delete_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_notice_data_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/get_setting_data_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/register_address_use_case.dart';
import 'package:instapay_clone/domain/use_case/setting/search_address_use_case.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_view_model.dart';
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

  return [
    ChangeNotifierProvider<RootViewModel>(
      create: (context) => RootViewModel(),
    ),
    ChangeNotifierProvider<MainScreenViewModel>(
      create: (context) => MainScreenViewModel(),
    ),
    ChangeNotifierProvider<MyWalletViewModel>(
      create: (context) => MyWalletViewModel(),
    ),
    ChangeNotifierProvider<SettingViewModel>(
      create: (context) => SettingViewModel(
        getSettingDataUseCase: GetSettingDataUseCase(settingRepository),
        getNoticeDataUseCase: GetNoticeDataUseCase(settingRepository),
        searchAddressUseCase: SearchAddressUseCase(searchAddressRepository),
        getAddressUseCase: GetAddressUseCase(getAddressRepository),
        registerAddressUseCase: RegisterAddressUseCase(registerAddressRepository),
        deleteAddressUseCase: DeleteAddressUseCase(deleteAddressRepository),
      ),
    ),
  ];
}
