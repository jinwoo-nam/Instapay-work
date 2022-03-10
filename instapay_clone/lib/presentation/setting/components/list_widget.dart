import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/setting_list_data.dart';
import 'package:instapay_clone/presentation/setting/components/payment_code_widget.dart';
import 'package:instapay_clone/presentation/setting/detail_page/address_screen.dart';
import 'package:instapay_clone/presentation/setting/detail_page/inquiry_screen.dart';
import 'package:instapay_clone/presentation/setting/detail_page/notice_screen.dart';
import 'package:instapay_clone/presentation/setting/detail_page/payment_code_chagne_screen.dart';
import 'package:instapay_clone/presentation/setting/detail_page/service_termination_screen.dart';
import 'package:instapay_clone/presentation/setting/detail_page/terms_of_use_screen.dart';

class ListWidget extends StatelessWidget {
  final SettingListData data;

  const ListWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                : Text(data.title),
            subtitle: data.subTitle != null ? Text(data.subTitle!) : null,
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
                      MaterialPageRoute(builder: (context) => const PaymentCodeChangeScreen()),
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
            height: 1,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
