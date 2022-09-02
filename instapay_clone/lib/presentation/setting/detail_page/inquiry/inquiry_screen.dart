import 'package:flutter/material.dart';
import 'package:instapay_clone/ui/color.dart' as color;

class InquiryScreen extends StatefulWidget {
  const InquiryScreen({Key? key}) : super(key: key);

  @override
  State<InquiryScreen> createState() => _InquiryScreenState();
}

class _InquiryScreenState extends State<InquiryScreen> {
  final _menuItems = [
    '서비스 이용방법',
    '결제 내역 및 취소',
    '회원 정보 및 보안',
    '오류신고',
    '이벤트',
    '기타',
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems = [];

  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = getDropDownMenuItems();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String item in _menuItems) {
      items.add(DropdownMenuItem(value: item, child: Text(item)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('문의하기'),
        backgroundColor: color.lightGrey,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 16.0, bottom: 16, left: 30, right: 30),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    hintText: '문의유형 선택',
                  ),
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '제목 입력',
                  ),
                ),
              ),
              const SizedBox(
                height: 7 * 24,
                child: TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    hintText: '상담 내용을 자세히 작성하여 주시기 바랍니다.',
                  ),
                ),
              ),
              Row(
                children: const [
                  Text('회신 주소'),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 16.0, right: 16, top: 8, bottom: 8),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '회신 주소',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('보내기'),
                    style: ElevatedButton.styleFrom(
                      primary: color.key,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changedDropDownItem(String? selected) {
    if (selected != null) {
      setState(() {});
    }
  }
}
