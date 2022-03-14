import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_account_data.freezed.dart';

part 'bank_account_data.g.dart';

@freezed
class BankAccountData with _$BankAccountData {
  factory BankAccountData({
    required String title,
    @Default(0) double balance,
    @Default('') String accountNumber,
    @Default('') String unit,
  }) = _BankAccountData;

  factory BankAccountData.fromJson(Map<String, dynamic> json) =>
      _$BankAccountDataFromJson(json);
}
