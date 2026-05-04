import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../routing/routes.dart';
import '../../../storage/secure_storage_token.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginError,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showDialog(
            context: context,
            builder: (_) => const Center(
              child: CircularProgressIndicator(color: Color(0xFFdab135)),
            ),
          ),
          success: (login) {
            Navigator.of(context).pop();
            final storage = SecureStorageToken();
            storage.saveTokens(token: login.access_token);
            Navigator.pushReplacementNamed(
              context,
              Routes.homeScreen,
            );
          },
          error: (error) {
            Navigator.of(context).pop();
            final String generalMessage = error.message ?? '';
            String fieldErrorsString = '';
            final fieldErrors = error.fieldErrors;
            if (fieldErrors != null && fieldErrors.isNotEmpty) {
              fieldErrors.forEach((key, value) {
                String errorValue = '';
                if (value is List) {
                  errorValue = value.join(', ');
                } else {
                  errorValue = value.toString();
                }
                fieldErrorsString += '\n$key: $errorValue';
              });
            }
            final String fullMessage = "$generalMessage$fieldErrorsString";

            CustomSnackbar.show(
              context,
              message: fullMessage,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
