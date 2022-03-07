import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/terms_of_use_list_data.dart';

class TermsOfUseDetailScreen extends StatelessWidget {
  final TermsOfUseListData data;
  const TermsOfUseDetailScreen({Key? key,required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(data.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0,left: 15,right: 15,bottom: 20),
        child: Text(data.content),
      ),
    );
  }
}
