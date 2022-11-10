import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/use_case/kfc/kfc_use_case.dart';

class KfcViewModel with ChangeNotifier {
  final KfcUseCase kfcUseCase;

  KfcViewModel({
    required this.kfcUseCase,
  }) {
    kfcFirst();
  }

  Future<void> kfcFirst() async {
    await kfcUseCase.kfcFirst();
  }
}
