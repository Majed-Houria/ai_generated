import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/models/detect_video.dart';
import '../../logic/detect_video_cubit.dart';
import '../../logic/detect_video_state.dart';

class VideoAnalysisBlocListener extends StatelessWidget {
  final Widget child;
  final VoidCallback onLoading;
  final Function(DetectVideo) onSuccess;

  const VideoAnalysisBlocListener({
    super.key,
    required this.child,
    required this.onLoading,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<DetectVideoCubit, DetectVideoState>(
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
                  'حدث خطأ أثناء فحص الفيديو',
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
