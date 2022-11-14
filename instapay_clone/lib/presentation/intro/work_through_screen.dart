import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/app_setting_data/app_setting_data.dart';
import 'package:instapay_clone/presentation/intro/terms_of_use_agree_screen.dart';
import 'package:instapay_clone/presentation/root_page/root_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class WorkThroughScreen extends StatefulWidget {
  const WorkThroughScreen({Key? key}) : super(key: key);

  @override
  State<WorkThroughScreen> createState() => _WorkThroughScreenState();
}

class _WorkThroughScreenState extends State<WorkThroughScreen> {
  int curPage = 0;
  final controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RootViewModel>();

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: color.mainNavy),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    curPage = index;
                  });
                },
                children: const [
                  WorkThroughWidget1(),
                  WorkThroughWidget2(),
                  WorkThroughWidget3(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: 85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.circle,
                          color: (curPage == 0)
                              ? color.key
                              : color.key.withOpacity(0.4),
                          size: 12,
                        ),
                        Icon(
                          Icons.circle,
                          color: (curPage == 1)
                              ? color.key
                              : color.key.withOpacity(0.4),
                          size: 12,
                        ),
                        Icon(
                          Icons.circle,
                          color: (curPage == 2)
                              ? color.key
                              : color.key.withOpacity(0.4),
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextButton(
                    onPressed: () async {
                      await viewModel
                          .changeSettingData(AppSettingData(isStartApp: true));

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const TermsOfUseAgreeScreen()),
                          (Route<dynamic> route) => false);
                    },
                    child: const Text(
                      '시작하기',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkThroughWidget1 extends StatelessWidget {
  const WorkThroughWidget1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 80,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Image.asset(
            'imgs/img-guide-1.png',
            scale: 1.2,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'QR코드만 있으면',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.white, fontSize: 19),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '어디서나 무엇을 사든지\n쉽게 결제할 수 있습니다.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class WorkThroughWidget2 extends StatelessWidget {
  const WorkThroughWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 80,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Image.asset(
            'imgs/img-guide-2.png',
            scale: 1.2,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          '현금이나 카드 없이도',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.white, fontSize: 19),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '한번의 계좌 등록만으로\n편리하게 결제할 수 있습니다.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class WorkThroughWidget3 extends StatelessWidget {
  const WorkThroughWidget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 80,
        ),
        Image.asset(
          'imgs/img-guide-4.png',
          scale: 1.2,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          '책 뒷표지의 바코드를 찍어서 결제하세요.\n20% 할인된 가격으로 바로 구매!',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '*책이 없을 경우 앱에서 를\n누른 후 검색해주세요.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
