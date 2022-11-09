import 'dart:math';

import 'package:flutter/material.dart';
import 'package:instapay_clone/ui/color.dart' as color;

class PaymentCodeChangeScreen extends StatefulWidget {
  const PaymentCodeChangeScreen({Key? key}) : super(key: key);

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
            padding: EdgeInsets.only(top: 60.0),
            child: Text(
              '결제 시 사용할 개인코드를 6자리 숫자로 입력해주세요.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100, left: 80, right: 80),
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
                      child: Text(num),
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
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: pinCodeList.length == 6 &&
                                pinCodeListAgain.length == 6
                            ? () {
                          //pinCodeList와 pinCodeListAgain 값 비교

                          //같으면 코드 저장

                          //key api 호출
                        }
                            : null,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(280, 45),
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
