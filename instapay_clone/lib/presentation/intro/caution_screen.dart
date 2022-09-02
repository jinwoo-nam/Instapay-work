import 'package:flutter/material.dart';
import 'package:instapay_clone/ui/color.dart' as color;

class CautionScreen extends StatelessWidget {
  const CautionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 130,
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading:false,
        backgroundColor: Colors.white,
        title: const Text(
          '사용자 인증',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 33,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: BoxDecoration(
                color: color.lightGrey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '주의!',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '인스타코인 ICO에 참여한 이용자는 반드시 참여과정 당시 등록한 이메일로 가입해 주세요.',
                    style: TextStyle(height: 1.7, fontSize: 17),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('확인'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
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
    );
  }
}
