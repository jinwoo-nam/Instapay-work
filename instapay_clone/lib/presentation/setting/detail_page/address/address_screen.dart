import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/setting/detail_page/address/address_list_widget.dart';
import 'package:instapay_clone/presentation/setting/detail_page/address/address_search_screen.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();
    final state = viewModel.state;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('주소'),
          backgroundColor: color.mainNavy,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddressSearchScreen()),
                );
              },
              icon: Image.asset(
                'imgs/wallet-plus@2x.png',
                width: 20,
                height: 20,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                'imgs/wallet-trash@2x.png',
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            const SizedBox(height: 20,),
            ...state.addressList.map((e) {
              return AddressListWidget(data: e);
            }).toList(),
          ],
        ));
  }
}
