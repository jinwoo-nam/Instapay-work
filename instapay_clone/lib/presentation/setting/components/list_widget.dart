import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/setting/components/setting_list_data.dart';

class ListWidget extends StatelessWidget {
  SettingListData data;

  ListWidget({Key? key, required this.data}) : super(key: key);

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
          ),
          Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
