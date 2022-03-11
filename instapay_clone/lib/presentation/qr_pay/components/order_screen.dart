import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/qr_pay/components/transaction_success_screen.dart';
import 'package:instapay_clone/presentation/setting/detail_page/payment_code_change/payment_code_widget.dart';
import 'package:instapay_clone/presentation/setting/detail_page/address/address_screen.dart';
import 'package:instapay_clone/ui/color.dart' as color;

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _menuItems = [
    'Deposit 0 KR',
    'Ethereum 0.00',
    '결제수단 추가',
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems = [];

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String item in _menuItems) {
      if (item == '결제수단 추가') {
        items.add(
          DropdownMenuItem(
            value: item,
            child: Row(
              children: [
                const Icon(Icons.add_circle),
                Text(item),
              ],
            ),
          ),
        );
      } else {
        items.add(DropdownMenuItem(value: item, child: Text(item)));
      }
    }
    return items;
  }

  void changedDropDownItem(String? selected) {
    if (selected != null) {
      if (selected == '결제수단 추가') {}
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결제'),
        backgroundColor: color.mainNavy,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    value: _menuItems[0],
                    items: _dropDownMenuItems,
                    onChanged: changedDropDownItem,
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '가맹점',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '인스타북스',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '상품명',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '요범사훈(운명에 속지 말고 주인공이 되자)',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '주문 번호',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Z29-H48TH',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '결제 금액',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '9540 원',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(child: Text('[EVENT 20% 할인] [만원이하 배송료 포함]')),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddressScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              '배송지 ',
                              style: TextStyle(fontSize: 15),
                            ),
                            Image.asset(
                              'imgs/pay-address-edit@2x.png',
                              width: 13,
                              height: 13,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        const Expanded(
                          child: Text(
                            '[06279] 서울특별시 강남구 도곡로 78길 13 (대치동, 대치동 삼성 3차 아파트) 123123123123',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black38),
                            maxLines: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                bool? isPinRight = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentCodeWidget()),
                );
                if (isPinRight != null && isPinRight) {
                  bool? isCheck = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TransactionSuccessScreen()),
                  );

                  Navigator.pop(context,true);
                }
              },
              child: const Text(
                '다음',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 50),
                primary: color.mainSelectColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
