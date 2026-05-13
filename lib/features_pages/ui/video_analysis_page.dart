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
                  success: (data) => _buildDetailedResultSection(data),
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
        _buildInstructionItem(LucideIcons.fileVideo, 'ارفع مقطع فيديو بتنسيق MP4 أو MOV.'),
        _buildInstructionItem(LucideIcons.scanFace, 'سيقوم النظام بتحليل الإطارات للكشف عن التلاعب (Deepfake).'),
        _buildInstructionItem(LucideIcons.shieldCheck, 'تأكد من وضوح الوجوه للحصول على أدق النتائج.'),
      ],
    );
  }

  Widget _buildInstructionItem(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(icon, color: ColorsManager.warning, size: 20.r),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.tajawal(
                fontSize: 14.sp,
                color: ColorsManager.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedResultSection(DetectVideo data) {
    double totalAiProb = 0;
    if (data.frames.isNotEmpty) {
      for (var frame in data.frames) {
        totalAiProb += frame.type.aiGenerated;
      }
      totalAiProb = (totalAiProb / data.frames.length) * 100;
    }
    
    final isAi = totalAiProb > 50;
    final statusColor = isAi ? ColorsManager.warning : ColorsManager.success;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            color: statusColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: statusColor.withValues(alpha: 0.3)),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 100.r,
                    width: 100.r,
                    child: CircularProgressIndicator(
                      value: totalAiProb / 100,
                      strokeWidth: 8,
                      backgroundColor: Colors.white10,
                      color: statusColor,
                    ),
                  ),
                  Text(
                    '${totalAiProb.toStringAsFixed(0)}%',
                    style: GoogleFonts.tajawal(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                isAi ? 'تم اكتشاف تلاعب عميق' : 'الفيديو يبدو موثوقاً',
                style: GoogleFonts.tajawal(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: statusColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                isAi 
                  ? 'هذا الفيديو يحتوي على علامات تشير إلى استخدام الذكاء الاصطناعي'
                  : 'لم يتم العثور على أدلة قوية تشير إلى تزييف عميق',
                textAlign: TextAlign.center,
                style: GoogleFonts.tajawal(
                  fontSize: 13.sp,
                  color: ColorsManager.textSecondary,
                ),
              ),
            ],
          ),
        ),
        
        if (data.frames.isNotEmpty) ...[
          SizedBox(height: 32.h),
          Text(
            'تفاصيل الإطارات المنبثقة (${data.frames.length})',
            style: GoogleFonts.tajawal(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 110.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: data.frames.length,
              separatorBuilder: (context, index) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {
                final frame = data.frames[index];
                final prob = frame.type.aiGenerated * 100;
                final frameIsAi = prob > 50;
                
                return Container(
                  width: 90.w,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: ColorsManager.cardBg,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: frameIsAi ? ColorsManager.warning.withValues(alpha: 0.5) : Colors.white10,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'إطار #${frame.info.position}',
                        style: GoogleFonts.tajawal(
                          fontSize: 11.sp,
                          color: ColorsManager.textSecondary,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        '${prob.toStringAsFixed(1)}%',
                        style: GoogleFonts.tajawal(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w800,
                          color: frameIsAi ? ColorsManager.warning : ColorsManager.success,
                        ),
                      ),
                      Icon(
                        frameIsAi ? LucideIcons.alertCircle : LucideIcons.check,
                        size: 14.r,
                        color: frameIsAi ? ColorsManager.warning : ColorsManager.success,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildVideoPlaceholder(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: _pickVideo,
          child: Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(
              color: ColorsManager.cardBg,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: ColorsManager.warning.withValues(alpha: 0.2),
                width: 1.5,
              ),
            ),
            child: _selectedVideo == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: ColorsManager.warning.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(LucideIcons.video, color: ColorsManager.warning, size: 40.r),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'اضغط لاختيار مقطع فيديو',
                        style: GoogleFonts.tajawal(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.textPrimary,
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(LucideIcons.fileVideo, color: ColorsManager.warning, size: 50.r),
                      SizedBox(height: 12.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          _selectedVideo!.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.tajawal(fontSize: 13.sp, color: ColorsManager.textPrimary),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        
        if (_selectedVideo != null)
           BlocBuilder<DetectVideoCubit, DetectVideoState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => _buildScannerOverlay(),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),

        if (_selectedVideo != null)
          Positioned(
            top: 12.r,
            left: 12.r,
            child: GestureDetector(
              onTap: _clearData,
              child: CircleAvatar(
                radius: 14.r,
                backgroundColor: Colors.black54,
                child: Icon(LucideIcons.x, color: Colors.white, size: 16.r),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildScannerOverlay() {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: AnimatedBuilder(
          animation: _scanController!,
          builder: (context, child) {
            return Stack(
              children: [
                Positioned(
                  top: _scanController!.value * 200.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 2.h,
                    decoration: BoxDecoration(
                      color: ColorsManager.warning,
                      boxShadow: [
                        BoxShadow(color: ColorsManager.warning, blurRadius: 10, spreadRadius: 2),
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
                        ColorsManager.warning.withValues(alpha: 0.05),
                        ColorsManager.warning.withValues(alpha: 0.15),
                        ColorsManager.warning.withValues(alpha: 0.05),
                      ],
                      stops: [
                        (_scanController!.value - 0.2).clamp(0, 1),
                        _scanController!.value,
                        (_scanController!.value + 0.2).clamp(0, 1),
                      ],
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
}
