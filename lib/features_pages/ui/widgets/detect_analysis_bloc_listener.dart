import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/models/detect_text.dart';
import '../../logic/detect_text_cubit.dart';
import '../../logic/detect_text_state.dart';

class DetectAnalysisBlocListener extends StatelessWidget {
  final Widget child;
  final VoidCallback onLoading;
  final Function(DetectText) onSuccess;

  const DetectAnalysisBlocListener({
    super.key,
    required this.child,
    required this.onLoading,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<DetectTextCubit, DetectTextState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () => onLoading(),
          success: (data) {
            onSuccess(data);
          },
          error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'حدث خطأ أثناء الرفع',
                  style: GoogleFonts.tajawal(),
                ),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      child: child,
    );
  }
}
