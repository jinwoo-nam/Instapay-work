import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/intro/terms_of_use_agree_screen.dart';
import 'package:instapay_clone/presentation/intro/work_through_screen.dart';
import 'package:instapay_clone/presentation/main_page/main_screen.dart';
import 'package:instapay_clone/presentation/root_page/root_view_model.dart';
import 'package:instapay_clone/presentation/sign_in/sign_in_screen.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  void initState() {
    Future.microtask(() async {
      final viewModel = context.read<RootViewModel>();
      viewModel.loadSettingData();
      String pinCode = await viewModel.getPinCode();
      print('pin code : $pinCode');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RootViewModel>();
    final state = viewModel.state;

    return !state.appSettingData.isStartApp
        ? const WorkThroughScreen()
        : !state.appSettingData.isAgreeTerms
            ? const TermsOfUseAgreeScreen()
            : viewModel.isSignIn == false
                ? const SignInScreen()
                : const MainScreen();
  }
}
