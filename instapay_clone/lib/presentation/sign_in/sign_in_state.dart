import 'package:instapay_clone/domain/model/sign_up/login_result_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_in_state.freezed.dart';
part 'sign_in_state.g.dart';

@freezed
class SignInState with _$SignInState {
  factory SignInState({
    LoginResultData? loginResult,
  }) = _SignInState;
  factory SignInState.fromJson(Map<String, dynamic> json) => _$SignInStateFromJson(json);
}