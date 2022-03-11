import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';
import 'package:instapay_clone/presentation/setting/detail_page/address/address_register_screen.dart';

class AddressSearchResultWidget extends StatelessWidget {
  final AddressData data;

  const AddressSearchResultWidget({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async{
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddressRegisterScreen(
                  data: data,
                ),
              ),
            );

            if(result != null && result == true) {
              Navigator.pop(context,true);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.0),
            child: Row(
              children: [
                Text('${data.postCode}'),
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                    child: Text(
                  data.address,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
