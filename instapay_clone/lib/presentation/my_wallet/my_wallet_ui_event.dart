import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_wallet_ui_event.freezed.dart';

@freezed
class MyWalletUiEvent with _$MyWalletUiEvent {
  const factory MyWalletUiEvent.showSnackBar(String message) = ShowSnackBar;
  const factory MyWalletUiEvent.changeDefaultAccount(String message) = ChangeDefaultAccount;
}
