import 'package:flutter/material.dart';

class ServiceTerminationScreen extends StatefulWidget {
  const ServiceTerminationScreen({Key? key}) : super(key: key);

  @override
  State<ServiceTerminationScreen> createState() =>
      _ServiceTerminationScreenState();
}

class _ServiceTerminationScreenState extends State<ServiceTerminationScreen> {
  String _selected = 'male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('서비스 해지'),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                  '1. 해지안내\n수집된 개인정보 및 결제수단 관련 정보는 모두 삭제되며 모바일 지로는 모두 해지처리 됩니다.'
                  '\n\n단 일부 기록은 관련 법령에 의하여 일정기간 동안 보존됩니다.\n'),
              Text('2. 해지사유\n다음번에는 회원님께 보다 나은 서비스를 제공할 수 있도록 해지 이유를 알려주십시오.'),
              ListTile(
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                leading: Radio<String>(
                  value: '필요없음(유용하지 않음)',
                  groupValue: _selected,
                  onChanged: (value) {
                    setState(() {
                      _selected = value!;
                    });
                  },
                ),
                title: const Text('필요없음(유용하지 않음)'),
              ),
              ListTile(
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                leading: Radio<String>(
                  value: '이용이 불편함',
                  groupValue: _selected,
                  onChanged: (value) {
                    setState(() {
                      _selected = value!;
                    });
                  },
                ),
                title: const Text('이용이 불편함'),
              ),
              ListTile(
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                leading: Radio<String>(
                  value: '잦은 소프트웨어 오류',
                  groupValue: _selected,
                  onChanged: (value) {
                    setState(() {
                      _selected = value!;
                    });
                  },
                ),
                title: const Text('잦은 소프트웨어 오류'),
              ),
              ListTile(
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                leading: Radio<String>(
                  value: '개인정보 유출 등 보안 우려',
                  groupValue: _selected,
                  onChanged: (value) {
                    setState(() {
                      _selected = value!;
                    });
                  },
                ),
                title: const Text('개인정보 유출 등 보안 우려'),
              ),
              ListTile(
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                leading: Radio<String>(
                  value: '사용가능한 은행계좌나 신용카드가 없음',
                  groupValue: _selected,
                  onChanged: (value) {
                    setState(() {
                      _selected = value!;
                    });
                  },
                ),
                title: const Text('사용가능한 은행계좌나 신용카드가 없음'),
              ),
              ListTile(
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                leading: Radio<String>(
                  value: '시험삼아 사용해 봄',
                  groupValue: _selected,
                  onChanged: (value) {
                    setState(() {
                      _selected = value!;
                    });
                  },
                ),
                title: const Text('시험삼아 사용해 봄'),
              ),
              ListTile(
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                leading: Radio<String>(
                  value: '기타',
                  groupValue: _selected,
                  onChanged: (value) {
                    setState(() {
                      _selected = value!;
                    });
                  },
                ),
                title: const Text('기타'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
