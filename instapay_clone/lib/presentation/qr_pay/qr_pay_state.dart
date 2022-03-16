import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instapay_clone/domain/model/qr_pay/book_order_data.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';

part 'qr_pay_state.freezed.dart';

part 'qr_pay_state.g.dart';

@freezed
class QrPayState with _$QrPayState {
  factory QrPayState({
    @Default([]) List<BankAccountData> accountList,
    AddressData? defaultAddress,
    BankAccountData? defaultAccount,
    BookOrderData? bookOrderData,
  }) = _QrPayState;

  factory QrPayState.fromJson(Map<String, dynamic> json) =>
      _$QrPayStateFromJson(json);
}
