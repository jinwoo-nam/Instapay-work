import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/intro/terms_of_use_agree_screen.dart';
import 'package:instapay_clone/presentation/intro/work_through_screen.dart';
import 'package:instapay_clone/presentation/main_page/main_screen.dart';
import 'package:instapay_clone/presentation/root_page/root_view_model.dart';
import 'package:instapay_clone/presentation/setting/detail_page/payment_code_change/payment_code_chagne_screen.dart';
import 'package:instapay_clone/presentation/sign_in/sign_in_screen.dart';
import 'package:instapay_clone/util/util.dart';
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
      viewModel.loadSettingData().then((isStartApp) async {
        if (!isStartApp) {
          //앱이 처음 시작일때
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const WorkThroughScreen()),
              (Route<dynamic> route) => false);
        } else if (!viewModel.checkAgreeTerms()) {
          //약관 동의 안했을때
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const TermsOfUseAgreeScreen()),
              (Route<dynamic> route) => false);
        } else {
          //자동 로그인
          String pinCode = await viewModel.getPinCode();
          print('pin code : $pinCode');

          print('auto login start');
          final result = await viewModel.instapayAutoLogin();
          if (result == LoginResult.pin) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const PaymentCodeChangeScreen(
                          isFirstPage: true,
                        )),
                (Route<dynamic> route) => false);
          } else if (result == LoginResult.ok) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const MainScreen()),
                (Route<dynamic> route) => false);
          } else {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SignInScreen()),
                (Route<dynamic> route) => false);
          }

          print('auto login end');
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Image.asset(
                'imgs/instapay_logo.jpeg',
                width: 220,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
