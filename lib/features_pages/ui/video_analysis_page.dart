import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theming/colors.dart';
import '../logic/detect_video_cubit.dart';
import '../logic/detect_video_state.dart';
import 'base_analysis_page.dart';
import '../../widgets/animated_button.dart';
import 'widgets/video_analysis_bloc_listener.dart';
import '../data/models/detect_video.dart';

class VideoAnalysisPage extends StatefulWidget {
  const VideoAnalysisPage({super.key});

  @override
  State<VideoAnalysisPage> createState() => _VideoAnalysisPageState();
}

class _VideoAnalysisPageState extends State<VideoAnalysisPage> with TickerProviderStateMixin {
  XFile? _selectedVideo;
  final ImagePicker _picker = ImagePicker();
  AnimationController? _scanController;

  @override
  void initState() {
    super.initState();
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _scanController?.dispose();
    super.dispose();
  }

  Future<void> _pickVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      setState(() {
        _selectedVideo = video;
      });
    }
  }

  void _clearData() {
    setState(() {
      _selectedVideo = null;
    });
    context.read<DetectVideoCubit>().emit(const DetectVideoState.initial());
    _scanController?.stop();
  }

  Future<void> _submitAnalysis() async {
    if (_selectedVideo == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'يرجى اختيار فيديو أولاً',
            style: GoogleFonts.tajawal(),
          ),
          backgroundColor: ColorsManager.warning,
        ),
      );
      return;
    }

    final formData = FormData.fromMap({
      'video': await MultipartFile.fromFile(
        _selectedVideo!.path,
        filename: _selectedVideo!.name,
      ),
    });

    if (mounted) {
      context.read<DetectVideoCubit>().detectVideo(formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return VideoAnalysisBlocListener(
      onLoading: () => _scanController?.repeat(reverse: true),
      onSuccess: (data) => _scanController?.stop(),
      child: BaseAnalysisPage(
        title: 'تحليل الفيديو والتزييف',
        icon: LucideIcons.video,
        themeColor: ColorsManager.warning,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            _buildVideoPlaceholder(context),
            SizedBox(height: 32.h),
            
            // Result or Instructions
            BlocBuilder<DetectVideoCubit, DetectVideoState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (data) => _buildResultSection(data),
                  orElse: () => _buildInstructionsSection(),
                );
              },
            ),

            SizedBox(height: 40.h),
            Center(
              child: BlocBuilder<DetectVideoCubit, DetectVideoState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const SizedBox.shrink(),
                    success: (_) => AnimatedButton(
                      text: 'فحص فيديو آخر',
                      isPrimary: true,
                      themeColor: ColorsManager.warning,
                      onTap: _clearData,
                    ),
                    orElse: () => AnimatedButton(
                      text: 'بدء التحليل العميق',
                      isPrimary: true,
                      themeColor: ColorsManager.warning,
                      onTap: _submitAnalysis,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تعليمات فحص الفيديو',
          style: GoogleFonts.tajawal(
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 12.h),
        _buildInstructionItem(
          LucideIcons.checkCircle2,
          'ارفع مقطع فيديو بتنسيق MP4 أو MOV.',
        ),
        _buildInstructionItem(
          LucideIcons.checkCircle2,
          'سيقوم النظام بتحليل الإطارات للكشف عن التلاعب (Deepfake).',
        ),
        _buildInstructionItem(
          LucideIcons.checkCircle2,
          'تأكد من وضوح الوجوه في الفيديو للحصول على أدق النتائج.',
        ),
      ],
    );
  }

  Widget _buildResultSection(DetectVideo data) {
    // Calculating average AI probability from all frames
    double totalAiProb = 0;
    if (data.frames.isNotEmpty) {
      for (var frame in data.frames) {
        totalAiProb += frame.type.aiGenerated;
      }
      totalAiProb = (totalAiProb / data.frames.length) * 100;
    }
    
    final isAi = totalAiProb > 50;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: (isAi ? ColorsManager.warning : ColorsManager.success).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: (isAi ? ColorsManager.warning : ColorsManager.success).withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'متوسط احتمالية التزييف',
                style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Icon(
                isAi ? LucideIcons.alertTriangle : LucideIcons.checkCircle2,
                size: 30.r,
                color: isAi ? ColorsManager.warning : ColorsManager.success,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            '${totalAiProb.toStringAsFixed(1)}%',
            style: GoogleFonts.tajawal(
              fontSize: 40.sp,
              fontWeight: FontWeight.w900,
              color: isAi ? ColorsManager.warning : ColorsManager.success,
            ),
          ),
          Text(
            isAi ? 'تم اكتشاف تلاعب عميق محتمل' : 'الفيديو يبدو أصلياً',
            style: GoogleFonts.tajawal(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: ColorsManager.textSecondary,
            ),
          ),
          if (data.frames.isNotEmpty) ...[
            SizedBox(height: 20.h),
            Divider(color: Colors.white10),
            SizedBox(height: 10.h),
            Text(
              'عدد الإطارات التي تم فحصها: ${data.frames.length}',
              style: GoogleFonts.tajawal(
                fontSize: 12.sp,
                color: ColorsManager.textSecondary,
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildVideoPlaceholder(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: _pickVideo,
          child: Container(
            width: double.infinity,
            height: 220.h,
            decoration: BoxDecoration(
              color: ColorsManager.cardBg.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: ColorsManager.warning.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: _selectedVideo == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LucideIcons.video,
                        color: ColorsManager.warning,
                        size: 60.r,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'اضغط لاختيار ملف فيديو (MP4)',
                        style: GoogleFonts.tajawal(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.textSecondary,
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LucideIcons.fileVideo,
                        color: ColorsManager.warning,
                        size: 60.r,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        _selectedVideo!.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.tajawal(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.textPrimary,
                        ),
                      ),
                      Text(
                        'جاهز للفحص',
                        style: GoogleFonts.tajawal(
                          fontSize: 12.sp,
                          color: ColorsManager.success,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        
        // Scanner Overlay
        if (_selectedVideo != null)
           BlocBuilder<DetectVideoCubit, DetectVideoState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => _buildScannerOverlay(),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),

        // Remove Button
        if (_selectedVideo != null)
          Positioned(
            top: 10.h,
            left: 10.w,
            child: GestureDetector(
              onTap: _clearData,
              child: Container(
                padding: EdgeInsets.all(5.r),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: Icon(LucideIcons.x, color: Colors.white, size: 20.r),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildScannerOverlay() {
    if (_scanController == null) return const SizedBox.shrink();

    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: AnimatedBuilder(
          animation: _scanController!,
          builder: (context, child) {
            return Stack(
              children: [
                Positioned(
                  top: _scanController!.value * 220.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: ColorsManager.warning,
                      boxShadow: [
                        BoxShadow(
                          color: ColorsManager.warning,
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ColorsManager.warning.withValues(alpha: 0.1),
                        ColorsManager.warning.withValues(alpha: 0.0),
                      ],
                      stops: [(_scanController!.value), (_scanController!.value + 0.1).clamp(0, 1)],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildInstructionItem(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: ColorsManager.warning, size: 20.r),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.tajawal(
                fontSize: 14.sp,
                color: ColorsManager.textSecondary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
