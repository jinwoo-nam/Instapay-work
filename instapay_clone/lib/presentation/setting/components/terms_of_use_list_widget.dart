import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/terms_of_use_list_data.dart';
import 'package:instapay_clone/presentation/setting/detail_page/terms_of_use_detail_screen.dart';

class TermsOfUseListWidget extends StatelessWidget {
  final TermsOfUseListData data;

  const TermsOfUseListWidget({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(data.title),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TermsOfUseDetailScreen(data: data,)),
              );
            },
          ),
          Divider(
            height: 5,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
