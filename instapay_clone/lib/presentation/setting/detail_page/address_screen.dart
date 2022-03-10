import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/setting/components/address_search_screen.dart';
import 'package:instapay_clone/ui/color.dart' as color;

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                MaterialPageRoute(builder: (context) => AddressSearchScreen()),
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
      body: Text(''),
    );
  }
}
