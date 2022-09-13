import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/my_wallet/components/bank_account_register_screen.dart';
import 'package:instapay_clone/presentation/qr_pay/components/order_loader.dart';
import 'package:instapay_clone/presentation/qr_pay/qr_pay_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class OrderOverlayWidget extends StatelessWidget {
  const OrderOverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QrPayViewModel>();
    final state = viewModel.state;

    return ValueListenableBuilder<bool>(
      valueListenable: OrderLoader.appLoader.loaderShowingNotifier,
      builder: (context, value, child) {
        if (value) {
          return Material(
            type: MaterialType.transparency,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  OrderLoader.appLoader.hideLoader();
                },
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.8)),
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Container(
                      width: 310,
                      height: 60 * (state.accountList.length + 1) + 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: state.accountList.length,
                              itemBuilder: (context, i) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        viewModel.setDefaultBankAccount(
                                          state.accountList[i],
                                        );
                                        OrderLoader.appLoader.hideLoader();
                                      },
                                      child: Center(
                                        child: SizedBox(
                                          height: 60,
                                          child: Center(
                                            child: Text(
                                              state.accountList[i].title,
                                              style: TextStyle(
                                                color: (state.accountList[i]
                                                            .title ==
                                                        state.defaultAccount
                                                            ?.title)
                                                    ? color.key
                                                    : Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      color: Colors.black,
                                      height: 1,
                                    ),
                                  ],
                                );
                              }),
                          InkWell(
                            onTap: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BankAccountRegisterScreen(),
                                ),
                              );
                              if (result != null) {
                                viewModel.addBankAccountData(result);
                              }
                            },
                            child: const SizedBox(
                              height: 60,
                              child: Center(
                                child: Text(
                                  '결제수단 추가',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
