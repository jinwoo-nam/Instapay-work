import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/kfc/kfc_view_model.dart';
import 'package:provider/provider.dart';

class KfcScreen extends StatelessWidget {
  const KfcScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<KfcViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text('kfc screen'),),
      body: Container(),
    );
  }
}
