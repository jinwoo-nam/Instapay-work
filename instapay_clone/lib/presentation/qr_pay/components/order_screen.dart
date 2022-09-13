import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:instapay_clone/domain/model/qr_pay/book_order_data.dart';
import 'package:instapay_clone/presentation/qr_pay/components/order_loader.dart';
import 'package:instapay_clone/presentation/qr_pay/components/transaction_success_screen.dart';
import 'package:instapay_clone/presentation/qr_pay/qr_pay_state.dart';
import 'package:instapay_clone/presentation/qr_pay/qr_pay_view_model.dart';
import 'package:instapay_clone/presentation/setting/detail_page/payment_code_change/payment_code_widget.dart';
import 'package:instapay_clone/presentation/setting/detail_page/address/address_screen.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  final BookOrderData data;

  const OrderScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final viewModel = context.read<QrPayViewModel>();
      await viewModel.fetchBankAccountData();
      await viewModel.fetchDefaultAddress();
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems(
      List<BankAccountData> account) {
    List<DropdownMenuItem<String>> items = [];
    for (BankAccountData item in account) {
      items.add(
        DropdownMenuItem(
          value: item.title,
          child: (item.accountNumber.length > 3)
              ? Text(
                  item.title +
                      ' ' +
                      '[${item.accountNumber.substring(0, 4)}..]',
                )
              : Text(
                  item.title + ' ' + item.accountNumber,
                ),
        ),
      );
    }
    items.add(
      DropdownMenuItem(
        value: '결제수단 추가',
        child: Row(
          children: const [
            Icon(Icons.add_circle),
            SizedBox(
              width: 10,
            ),
            Text('결제수단 추가'),
          ],
        ),
      ),
    );
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QrPayViewModel>();
    final state = viewModel.state;
    var numFormat = NumberFormat('###,###,###,###');

    return Scaffold(
      appBar: AppBar(
        title: const Text('결제'),
        backgroundColor: color.mainNavy,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 30),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        OrderLoader.appLoader.showLoader();
                      },
                      child: SizedBox(
                        width: 150,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              state.defaultAccount?.title ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Icon(Icons.arrow_drop_down_sharp),
                          ],
                        ),
                        // child: DropdownButtonFormField(
                        //   decoration: const InputDecoration(
                        //     border: InputBorder.none,
                        //   ),
                        //   value: getDefaultValue(state),
                        //   items: getDropDownMenuItems(state.accountList),
                        //   onChanged: (selected) async {
                        //     if (selected != null && selected == '결제수단 추가') {
                        //       final result = await Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) =>
                        //               const BankAccountRegisterScreen(),
                        //         ),
                        //       );
                        //       if (result != null) {
                        //         viewModel.addBankAccountData(result);
                        //       }
                        //     }
                        //   },
                        // ),
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
                        children: [
                          const Text(
                            '가맹점',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            widget.data.affiliate,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '상품명',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            widget.data.bookName,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '주문 번호',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            widget.data.orderNumber,
                            style: const TextStyle(fontSize: 15),
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
                        children: [
                          const Text(
                            '결제 금액',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            '${numFormat.format(widget.data.amountOfMoney)} KRW',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child:
                          Center(child: Text('[EVENT 20% 할인] [만원이하 배송료 포함]')),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddressScreen()),
                        );
                        viewModel.fetchDefaultAddress();
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
                            Expanded(
                              child: state.defaultAddress == null
                                  ? const Text('등록된 주소지가 없습니다.')
                                  : Text(
                                      '[${state.defaultAddress!.postCode}] ${state.defaultAddress!.address} ${state.defaultAddress!.detailAddress}',
                                      style: const TextStyle(
                                          fontSize: 13, color: Colors.black38),
                                      maxLines: 4,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
                ElevatedButton(
                  onPressed: () async {
                    bool? isPinRight = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentCodeWidget()),
                    );
                    if (isPinRight != null && isPinRight) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionSuccessScreen(
                                  orderData: widget.data,
                                )),
                      );

                      Navigator.pop(context, true);
                    }
                  },
                  child: const Text(
                    '다음',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
                    primary: color.key,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? getDefaultValue(QrPayState state) {
    if (state.defaultAccount != null) {
      return state.defaultAccount!.title;
    }
    return null;
  }
}
