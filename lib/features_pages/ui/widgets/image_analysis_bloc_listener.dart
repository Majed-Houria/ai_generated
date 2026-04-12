import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/models/detect_image.dart';
import '../../logic/detect_image_cubit.dart';
import '../../logic/detect_image_state.dart';

class ImageAnalysisBlocListener extends StatelessWidget {
  final Widget child;
  final VoidCallback onLoading;
  final Function(DetectImage) onSuccess;

  const ImageAnalysisBlocListener({
    super.key,
    required this.child,
    required this.onLoading,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<DetectImageCubit, DetectImageState>(
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
