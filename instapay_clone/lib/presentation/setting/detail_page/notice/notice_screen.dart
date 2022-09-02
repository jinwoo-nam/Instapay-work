import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/setting/detail_page/notice/notice_list_widget.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '공지사항',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: color.lightGrey,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView(
          children:
              state.noticeList.map((e) => NoticeListWidget(data: e)).toList(),
        ),
      ),
    );
  }
}
