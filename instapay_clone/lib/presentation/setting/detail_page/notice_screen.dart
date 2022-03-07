import 'package:flutter/material.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('공지사항'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: [
          
        ],
      ),
    );
  }
}
