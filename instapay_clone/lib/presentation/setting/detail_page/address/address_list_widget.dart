import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';
import 'package:instapay_clone/domain/model/setting/juso_info.dart';

class AddressListWidget extends StatelessWidget {
  final JusoInfo data;

  const AddressListWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.jtitle,
            style: const TextStyle(
              height: 1.7,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            '[${data.zip}] ${data.fixed} ${data.user}',
            style: const TextStyle(
              height: 1.7,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            data.tel,
            style: const TextStyle(
              height: 1.7,
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 30,
          ),
        ],
      ),
    );
  }
}
