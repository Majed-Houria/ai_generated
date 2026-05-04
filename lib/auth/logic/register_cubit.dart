import 'package:flutter_bloc/flutter_bloc.dart';

import '../../networking/api_result.dart';
import '../data/repository/auth_repository.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository authRepository;
  RegisterCubit(this.authRepository) : super(RegisterState.initial());

  Future<void> register(Map<String, dynamic> data) async {
    emit(RegisterState.loading());

    final result = await authRepository.register(data);

    result.when(
      success: (register) async {
        emit(RegisterState.success(register));
      },
      failure: (error) {
        emit(RegisterState.error(error: error));
      },
    );
  }
}
