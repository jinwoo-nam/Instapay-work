import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/setting/juso_search_result_data.dart';

class AddressSearchResultWidget extends StatelessWidget {
  final JusoSearchResultData data;

  const AddressSearchResultWidget({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 13.0),
          child: Row(
            children: [
              Text(data.zip),
              const SizedBox(
                width: 40,
              ),
              Expanded(
                  child: Text(
                data.juso,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
