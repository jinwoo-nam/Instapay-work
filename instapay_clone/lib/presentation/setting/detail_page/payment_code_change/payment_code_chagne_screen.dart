import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/main_page/main_screen.dart';
import 'package:instapay_clone/presentation/root_page/root_view_model.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:instapay_clone/util/util.dart';
import 'package:provider/provider.dart';

class PaymentCodeChangeScreen extends StatefulWidget {
  final bool isFirstPage;

  const PaymentCodeChangeScreen({Key? key, this.isFirstPage = false})
      : super(key: key);

  @override
  State<PaymentCodeChangeScreen> createState() =>
      _PaymentCodeChangeScreenState();
}

class _PaymentCodeChangeScreenState extends State<PaymentCodeChangeScreen> {
  int numIndex = 0;
  String code = '';
  List<String> pinCodeList = [];
  List<String> pinCodeListAgain = [];

  @override
  void initState() {
    super.initState();
    makeRandomNumList();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();

    numIndex = 0;
    return Scaffold(
      backgroundColor: color.mainNavy,
      appBar: AppBar(
        backgroundColor: color.mainNavy,
        title: const Text('결제코드 설정'),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Text(
              '결제 시 사용할 개인코드를 6자리 숫자로 입력해주세요.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    showPinCode(0),
                    showPinCode(1),
                    showPinCode(2),
                    showPinCode(3),
                    showPinCode(4),
                    showPinCode(5),
                  ],
                ),
                Divider(
                  height: 25,
                  thickness: 1.3,
                  color: pinCodeList.length < 6 ? color.key : Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    showPinCodeAgain(0),
                    showPinCodeAgain(1),
                    showPinCodeAgain(2),
                    showPinCodeAgain(3),
                    showPinCodeAgain(4),
                    showPinCodeAgain(5),
                  ],
                ),
                Divider(
                  height: 25,
                  thickness: 1.3,
                  color: pinCodeList.length == 6 ? color.key : Colors.white,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 10,
                spreadRadius: 10,
              ),
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 3 / 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    String num = getText();
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          onButtonClick(num);
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(color.mainNavy),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      child: Text(num),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: pinCodeList.length == 6 &&
                                pinCodeListAgain.length == 6
                            ? () async {
                                if (listEquals(pinCodeList, pinCodeListAgain)) {
                                  String code = pinCodeList.join();
                                  print(code);
                                  await viewModel.savePinCode(code);
                                  final res = await viewModel.keyRegister(code);
                                  if (res == LoginResult.ok) {
                                    if (widget.isFirstPage) {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MainScreen()),
                                          (Route<dynamic> route) => false);
                                    } else {
                                      Navigator.pop(context);
                                    }
                                  }
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: const Text('알림'),
                                            content: const Text(
                                                '결제코드가 일치하지 않습니다.\n처음부터 정확히 입력해주세요.'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  child: const Text('확인'))
                                            ],
                                          ));
                                  setState(() {
                                    pinCodeList.clear();
                                    pinCodeListAgain.clear();
                                  });
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(220, 45),
                          primary: color.key,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Text('다음'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (pinCodeListAgain.isNotEmpty) {
                                pinCodeListAgain.removeLast();
                              } else if (pinCodeList.isNotEmpty) {
                                pinCodeList.removeLast();
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.backspace,
                            size: 45,
                            color: color.key,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showPinCode(int index) {
    return pinCodeList.length >= index + 1
        ? pinCodeList.length == index + 1
            ? Text(
                pinCodeList[index],
                style: const TextStyle(
                  fontSize: 20,
                  color: color.key,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const Icon(
                Icons.circle,
                size: 16,
                color: color.key,
              )
        : const Icon(
            Icons.circle,
            size: 16,
            color: Colors.grey,
          );
  }

  Widget showPinCodeAgain(int index) {
    return pinCodeListAgain.length >= index + 1
        ? pinCodeListAgain.length == index + 1
            ? Text(
                pinCodeListAgain[index],
                style: const TextStyle(
                  fontSize: 20,
                  color: color.key,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const Icon(
                Icons.circle,
                size: 16,
                color: color.key,
              )
        : const Icon(
            Icons.circle,
            size: 16,
            color: Colors.grey,
          );
  }

  final numList = const [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
    ' ',
    ' '
  ];
  List<int> indexList = [];
  List<String> randomNumList = [];

  void makeRandomNumList() {
    for (int i = 0; i < 12; i++) {
      Random random = Random();
      int num;
      while (true) {
        num = random.nextInt(12);
        if (indexList.contains(num) == false) {
          indexList.add(num);
          break;
        }
      }
      randomNumList.add(numList[num]);
    }
  }

  String getText() {
    return randomNumList[numIndex++];
  }

  void onButtonClick(String num) {
    if (pinCodeList.length < 6) {
      switch (num) {
        case ' ':
          break;
        case '1':
          pinCodeList.add('1');
          break;
        case '2':
          pinCodeList.add('2');
          break;
        case '3':
          pinCodeList.add('3');
          break;
        case '4':
          pinCodeList.add('4');
          break;
        case '5':
          pinCodeList.add('5');
          break;
        case '6':
          pinCodeList.add('6');
          break;
        case '7':
          pinCodeList.add('7');
          break;
        case '8':
          pinCodeList.add('8');
          break;
        case '9':
          pinCodeList.add('9');
          break;
        case '0':
          pinCodeList.add('0');
          break;
      }
    } else if (pinCodeListAgain.length < 6) {
      switch (num) {
        case ' ':
          break;
        case '1':
          pinCodeListAgain.add('1');
          break;
        case '2':
          pinCodeListAgain.add('2');
          break;
        case '3':
          pinCodeListAgain.add('3');
          break;
        case '4':
          pinCodeListAgain.add('4');
          break;
        case '5':
          pinCodeListAgain.add('5');
          break;
        case '6':
          pinCodeListAgain.add('6');
          break;
        case '7':
          pinCodeListAgain.add('7');
          break;
        case '8':
          pinCodeListAgain.add('8');
          break;
        case '9':
          pinCodeListAgain.add('9');
          break;
        case '0':
          pinCodeListAgain.add('0');
          break;
      }
    }
    if (pinCodeList.length == 6 && pinCodeListAgain.length == 6) {
      //Navigator.pop(context, true);
    }
  }
}
