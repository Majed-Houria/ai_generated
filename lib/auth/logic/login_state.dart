
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../networking/api_error_handler.dart';
import '../data/models/login.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.success(Login login) = LoginSuccess;
  const factory LoginState.error({required ErrorHandler error}) = LoginError;
}