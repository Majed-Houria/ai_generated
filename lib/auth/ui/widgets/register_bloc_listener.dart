import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../routing/routes.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../logic/login_cubit.dart';
import '../../logic/register_cubit.dart';
import '../../logic/register_state.dart';

class RegisterBlocListener extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const RegisterBlocListener({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisterLoading ||
          current is RegisterSuccess ||
          current is RegisterError,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(color: Color(0xFFdab135)),
            ),
          ),
          success: (register) {
            Navigator.of(context).pop();
            // Trigger login automatically after successful registration
            context.read<LoginCubit>().login({
              "email": emailController.text.trim(),
              "password": passwordController.text.trim(),
            });
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
