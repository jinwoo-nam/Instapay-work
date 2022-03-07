import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/notice_list_data.dart';
import 'package:instapay_clone/presentation/setting/detail_page/notice_detail_screen.dart';

class NoticeListWidget extends StatelessWidget {
  final NoticeListData data;

  const NoticeListWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.date,
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  data.title,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoticeDetailScreen(data: data,)),
              );
            },
          ),
          Divider(
            height: 30,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
