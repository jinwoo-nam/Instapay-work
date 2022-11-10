import 'dart:math';

import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class PaymentCodeWidget extends StatefulWidget {
  const PaymentCodeWidget({Key? key}) : super(key: key);

  @override
  State<PaymentCodeWidget> createState() => _PaymentCodeWidget();
}

class _PaymentCodeWidget extends State<PaymentCodeWidget> {
  int numIndex = 0;

  List<String> pinCodeList = [];

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
      appBar: AppBar(
        backgroundColor: color.mainNavy,
        title: const Text('결제 코드'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Text(
              '결제코드를 입력해 주세요',
              style: TextStyle(fontSize: 16),
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
                const Divider(
                  height: 25,
                  thickness: 1.3,
                  color: color.key,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    '결제 코드를 잊으셨습니까?',
                    style: TextStyle(
                      color: color.key,
                    ),
                  ),
                  onPressed: () {},
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
                      onPressed: () async {
                        String orgPin = await viewModel.getPinCode();
                        setState(() {
                          onButtonClick(num, orgPin);
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
                  padding:
                      const EdgeInsets.only(right: 30, top: 10, bottom: 15),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (pinCodeList.isNotEmpty) {
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
                    fontWeight: FontWeight.bold),
              )
            : const Icon(
                Icons.circle,
                size: 16,
                color: color.key,
              )
        : const Icon(
            Icons.circle,
            size: 16,
            color: Colors.black38,
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

  void onButtonClick(String num, String orgPinCode) {
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
    if (pinCodeList.length >= 6) {
      String str = pinCodeList.join('');
      pinCodeList.clear();
      if (str != orgPinCode) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('알림'),
                  content: const Text('결제코드가 일치하지 않습니다.\n처음부터 정확히 입력해주세요.'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('확인'))
                  ],
                ));
        return;
      }
      Navigator.pop(context, true);
    }
  }
}
