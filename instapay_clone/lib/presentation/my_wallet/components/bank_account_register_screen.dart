import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:webview_flutter/webview_flutter.dart';

class BankAccountRegisterScreen extends StatefulWidget {
  const BankAccountRegisterScreen({Key? key}) : super(key: key);

  @override
  State<BankAccountRegisterScreen> createState() =>
      _BankAccountRegisterScreenState();
}

class _BankAccountRegisterScreenState extends State<BankAccountRegisterScreen> {
  final bankController = TextEditingController();
  final accountController = TextEditingController();

  @override
  void dispose() {
    bankController.dispose();
    accountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('출금계좌 등록'),
        backgroundColor: color.mainNavy,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 400,
              child: WebView(
                initialUrl:
                    'https://t1.daumcdn.net/cfile/tistory/99C331365EF14A2B19',
              ),
            ),
            Row(
              children: [
                const Text('은행'),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: TextField(
                  controller: bankController,
                ),
                    )),
              ],
            ),
            Row(
              children: [
                const Text('계좌'),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: TextField(
                  controller: accountController,
                ),
                    )),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  BankAccountData(
                    title: bankController.text,
                    accountNumber: accountController.text,
                  ),
                );
              },
              child: const Text(
                '확인',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
