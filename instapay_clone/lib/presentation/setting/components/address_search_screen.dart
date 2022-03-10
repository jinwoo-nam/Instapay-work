import 'package:flutter/material.dart';
import 'package:instapay_clone/ui/color.dart' as color;

class AddressSearchScreen extends StatelessWidget {
  const AddressSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('주소 검색'),
        backgroundColor: color.mainNavy,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: '도로명주소: 도로명과 건물번호',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: color.mainSelectColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: color.mainSelectColor),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'imgs/address-search@2x.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              '도로명 주소: 도로명과 건물 번호',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('       예) 테헤란로 520, 거북골로 23길'),
            const SizedBox(
              height: 40,
            ),
            const Text(
              '지번 주소: 지번과 번지수',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('       예) 대치동 945, 북가좌동 348'),
          ],
        ),
      ),
    );
  }
}
