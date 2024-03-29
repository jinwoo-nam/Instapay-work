import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/setting/notice_list_data.dart';
import 'package:instapay_clone/ui/color.dart' as color;

class NoticeDetailScreen extends StatelessWidget {
  final NoticeListData data;

  const NoticeDetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('공지 사항'),
        backgroundColor: color.lightGrey,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            Text(
              data.ftitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              data.adate,
              style: const TextStyle(fontSize: 13, color: Colors.black38),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data.fmsg,
                style: const TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
