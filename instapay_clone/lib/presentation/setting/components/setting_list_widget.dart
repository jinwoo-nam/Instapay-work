import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/setting/setting_list_data.dart';
import 'package:instapay_clone/presentation/setting/detail_page/payment_code_change/payment_code_widget.dart';
import 'package:instapay_clone/presentation/setting/detail_page/address/address_screen.dart';
import 'package:instapay_clone/presentation/setting/detail_page/inquiry/inquiry_screen.dart';
import 'package:instapay_clone/presentation/setting/detail_page/notice/notice_screen.dart';
import 'package:instapay_clone/presentation/setting/detail_page/payment_code_change/payment_code_chagne_screen.dart';
import 'package:instapay_clone/presentation/setting/detail_page/service_termination/service_termination_screen.dart';
import 'package:instapay_clone/presentation/setting/detail_page/terms_of_use/terms_of_use_screen.dart';
import 'package:instapay_clone/presentation/setting/setting_state.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:provider/provider.dart';

class SettingListWidget extends StatelessWidget {
  final SettingListData data;

  const SettingListWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();
    final state = viewModel.state;

    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: (data.title == '공지 사항')
                ? Row(
                    children: [
                      Text(data.title + ' '),
                      Image.asset(
                        'imgs/new_alert@2x.png',
                        width: 18,
                        height: 18,
                      ),
                    ],
                  )
                : Text(
                    data.title,
                    style: const TextStyle(height: 1.3),
                  ),
            subtitle: getSubtitle(state),
            trailing: data.isTrailing == true
                ? const Icon(
                    Icons.arrow_forward_ios_outlined,
                  )
                : null,
            minVerticalPadding: 0,
            onTap: () async {
              switch (data.type) {
                case SettingType.paymentCodeChange:
                  bool? check = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const PaymentCodeWidget();
                    }),
                  );
                  if (check != null && check == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PaymentCodeChangeScreen()),
                    );
                  }
                  break;
                case SettingType.address:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddressScreen()),
                  );
                  break;
                case SettingType.appVersion:
                  break;
                case SettingType.notice:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NoticeScreen()),
                  );
                  break;
                case SettingType.termsOfUse:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermsOfUseScreen()),
                  );
                  break;
                case SettingType.inquiry:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InquiryScreen()),
                  );
                  break;
                case SettingType.serviceTermination:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ServiceTerminationScreen()),
                  );
                  break;
              }
            },
          ),
          const Divider(
            height: 8,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Text? getSubtitle(SettingState state) {
    if (data.title == '주소지') {
      if (state.addressList.isEmpty) {
        return const Text(
          '등록된 주소지가 없습니다.',
          style: TextStyle(
            height: 1.1,
            color: Colors.white54,
          ),
        );
      } else {
        return Text(
          '[${state.defaultAddress!.postCode}] ${state.defaultAddress!.address}',
          style: const TextStyle(
            height: 1.2,
            color: Colors.white54,
          ),
        );
      }
    } else {
      return data.subTitle != null
          ? Text(
              data.subTitle!,
              style: const TextStyle(
                height: 1.2,
                color: Colors.white54,
              ),
            )
          : null;
    }
  }
}
