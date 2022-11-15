import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instapay_clone/domain/model/my_wallet/means_data.dart';
part 'my_wallet_state.freezed.dart';
part 'my_wallet_state.g.dart';

@freezed
class MyWalletState with _$MyWalletState {
  factory MyWalletState({
    @Default(false) bool isSelectedDelete,
    BankAccountData? defaultAccount,
    MeansData? deleteSelectAccount,
    @Default([]) List<MeansData> meansDataList,
    @Default('') String defaultMid,
  }) = _MyWalletState;
  factory MyWalletState.fromJson(Map<String, dynamic> json) => _$MyWalletStateFromJson(json);
}