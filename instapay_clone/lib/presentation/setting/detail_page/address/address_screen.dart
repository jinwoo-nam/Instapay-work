import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/setting/detail_page/address/address_list_widget.dart';
import 'package:instapay_clone/presentation/setting/detail_page/address/address_search_screen.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final viewModel = context.read<SettingViewModel>();
      viewModel.clearAddressState();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();
    final state = viewModel.state;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('주소지'),
          backgroundColor: color.lightGrey,
          foregroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () async {
                if (state.addressDeleteEnable == false) {
                  final newAddress = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddressSearchScreen()),
                  );
                  if (newAddress != null) {
                    viewModel.setDefaultAddress(newAddress);
                  }
                } else {
                  viewModel.clickAddressDelete();
                }
              },
              icon: (state.addressDeleteEnable == false)
                  ? Image.asset(
                      'imgs/wallet-plus@2x.png',
                      width: 20,
                      height: 20,
                      color: Colors.black,
                    )
                  : Image.asset(
                      'imgs/exit_x@2x.png',
                      width: 20,
                      height: 20,
                      color: Colors.black,
                    ),
            ),
            IconButton(
              onPressed: () {
                if (state.addressDeleteEnable == false) {
                  viewModel.clickAddressDelete();
                } else {
                  if (state.deleteSelectedAddress != null) {
                    viewModel.deleteAddress(state.deleteSelectedAddress!);
                  }
                }
              },
              icon: Image.asset(
                'imgs/wallet-trash@2x.png',
                width: 20,
                height: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              ...state.addressList.map((e) {
                return GestureDetector(
                  onTap: () {
                    if (state.addressDeleteEnable) {
                      viewModel.setDeleteSelectedAddress(e);
                    } else {
                      viewModel.setDefaultAddress(e);
                      Navigator.pop(context);
                    }
                  },
                  child: Row(
                    children: [
                      Visibility(
                        visible: state.addressDeleteEnable,
                        child: (state.deleteSelectedAddress == e)
                            ? const Icon(Icons.circle)
                            : const Icon(Icons.circle_outlined),
                      ),
                      Expanded(child: AddressListWidget(data: e)),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ));
  }
}
