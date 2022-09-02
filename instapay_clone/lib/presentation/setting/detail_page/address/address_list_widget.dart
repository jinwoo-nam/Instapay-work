import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';

class AddressListWidget extends StatelessWidget {
  final AddressData data;

  const AddressListWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.name!,
            style: const TextStyle(
              height: 1.7,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            '[${data.postCode}] ${data.address}',
            style: const TextStyle(
              height: 1.7,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            '${data.contact}',
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
