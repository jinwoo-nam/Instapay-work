import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/app_setting_data/app_setting_data.dart';
import 'package:instapay_clone/presentation/root_page/root_screen.dart';
import 'package:instapay_clone/presentation/root_page/root_view_model.dart';
import 'package:instapay_clone/presentation/setting/detail_page/terms_of_use/terms_of_use_list_widget.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class TermsOfUseAgreeScreen extends StatefulWidget {
  const TermsOfUseAgreeScreen({Key? key}) : super(key: key);

  @override
  State<TermsOfUseAgreeScreen> createState() => _TermsOfUseAgreeScreenState();
}

class _TermsOfUseAgreeScreenState extends State<TermsOfUseAgreeScreen> {
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();
    final rootViewModel = context.watch<RootViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('이용약관 동의'),
        backgroundColor: color.lightGrey,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
              child: ListView(
                shrinkWrap: true,
                children: state.termsOfUseList
                    .map((e) => TermsOfUseListWidget(data: e))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isAgree = !isAgree;
                  });
                },
                child: Row(
                  children: [
                    isAgree
                        ? const Icon(
                            Icons.circle,
                            size: 17,
                          )
                        : const Icon(
                            Icons.circle_outlined,
                            size: 17,
                          ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      '위 약관에 모두 동의합니다.',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: isAgree
                      ? () async {
                          await rootViewModel.changeSettingData(
                            AppSettingData(
                              isStartApp: true,
                              isAgreeTerms: true,
                            ),
                          );

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const RootScreen()),
                              (Route<dynamic> route) => false);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
                    backgroundColor: color.key,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text('다음'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
