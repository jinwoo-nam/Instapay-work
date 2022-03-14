import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/setting/detail_page/terms_of_use/terms_of_use_list_widget.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('이용약관'),
        backgroundColor: color.mainNavy,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
        child: ListView(
          children: state.termsOfUseList
              .map((e) => TermsOfUseListWidget(data: e))
              .toList(),
        ),
      ),
    );
  }
}
