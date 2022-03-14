import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'my_wallet_state.freezed.dart';
part 'my_wallet_state.g.dart';

@freezed
class MyWalletState with _$MyWalletState {
  factory MyWalletState({
    @Default([]) List<BankAccountData> accountList,
    @Default(false) bool isSelectedDelete,
  }) = _MyWalletState;
  factory MyWalletState.fromJson(Map<String, dynamic> json) => _$MyWalletStateFromJson(json);
}