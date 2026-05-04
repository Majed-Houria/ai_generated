
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../networking/api_error_handler.dart';
import '../data/models/register.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = RegisterInitial;
  const factory RegisterState.loading() = RegisterLoading;
  const factory RegisterState.success(Register register) = RegisterSuccess;
  const factory RegisterState.error({required ErrorHandler error}) = RegisterError;
}