import 'package:flutter_bloc/flutter_bloc.dart';

import '../../networking/api_result.dart';
import '../data/repository/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;
  LoginCubit(this.authRepository) : super(LoginState.initial());

  Future<void> login(Map<String, dynamic> data) async {
    emit(LoginState.loading());

    final result = await authRepository.login(data);

    result.when(
      success: (login) async {
        emit(LoginState.success(login));
      },
      failure: (error) {
        emit(LoginState.error(error: error));
      },
    );
  }
}
