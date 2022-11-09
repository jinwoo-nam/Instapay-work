import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/setting/detail_page/payment_code_change/payment_code_chagne_screen.dart';
import 'package:instapay_clone/presentation/sign_in/sign_in_view_model.dart';
import 'package:instapay_clone/ui/color.dart';
import 'package:provider/provider.dart';

class LoginWaitScreen extends StatelessWidget {
  final String email;

  const LoginWaitScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SignInViewModel>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '사용자 인증',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 33,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                      bottom: 8,
                    ),
                    child: Text(
                      '아래의 주소로 메일이 발송되었습니다.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      email,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Icon(
                      Icons.mail_outline,
                      size: 100,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      '받으신 메일을 열고 안내에 따라 인증해 주세요.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: Column(
                children: [
                  const Text(
                    '메일 인증을 마치셨다면 아래 버튼을 눌러주세요.',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 300,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: lightGrey,
                        elevation: 0,
                      ),
                      onPressed: () async {
                        final res = await viewModel.instapayEmailCheck();
                        if (res) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PaymentCodeChangeScreen()),
                              (Route<dynamic> route) => false);
                        }
                      },
                      child: const Text(
                        '인증을 완료했습니다',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
