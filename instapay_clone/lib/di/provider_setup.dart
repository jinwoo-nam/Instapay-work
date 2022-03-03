import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_view_model.dart';
import 'package:instapay_clone/presentation/root_page/root_view_model.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> getProviders() async {
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
      create: (context) => SettingViewModel(),
    ),

  ];
}