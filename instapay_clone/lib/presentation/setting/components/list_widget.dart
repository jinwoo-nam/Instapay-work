import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/setting_list_data.dart';
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
            title: Text(data.title),
            subtitle: data.subTitle != null ? Text(data.subTitle!) : null,
            trailing: data.isTrailing == true
                ? Icon(
                    Icons.arrow_forward_ios_outlined,
                  )
                : null,
            minVerticalPadding: 0,
            onTap: () {
              switch (data.type) {
                case SettingType.paymentCodeChange:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentCodeChangeScreen()),
                  );
                  break;
                case SettingType.address:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddressScreen()),
                  );
                  break;
                case SettingType.appVersion:
                  break;
                case SettingType.notice:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NoticeScreen()),
                  );
                  break;
                case SettingType.termsOfUse:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TermsOfUseScreen()),
                  );
                  break;
                case SettingType.inquiry:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InquiryScreen()),
                  );
                  break;
                case SettingType.serviceTermination:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ServiceTerminationScreen()),
                  );
                  break;
              }
            },
          ),
          Divider(
            height: 1,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
