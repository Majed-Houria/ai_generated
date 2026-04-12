import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theming/colors.dart';
import '../logic/detect_image_cubit.dart';
import '../logic/detect_image_state.dart';
import 'base_analysis_page.dart';
import '../../widgets/animated_button.dart';
import 'widgets/image_analysis_bloc_listener.dart';

class ImageAnalysisPage extends StatefulWidget {
  const ImageAnalysisPage({super.key});

  @override
  State<ImageAnalysisPage> createState() => _ImageAnalysisPageState();
}

class _ImageAnalysisPageState extends State<ImageAnalysisPage> with TickerProviderStateMixin {
  XFile? _selectedImage;
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

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  void _clearData() {
    setState(() {
      _selectedImage = null;
    });
    context.read<DetectImageCubit>().emit(const DetectImageState.initial());
    _scanController?.stop();
  }

  Future<void> _submitAnalysis() async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'يرجى اختيار صورة أولاً',
            style: GoogleFonts.tajawal(),
          ),
          backgroundColor: ColorsManager.warning,
        ),
      );
      return;
    }

    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        _selectedImage!.path,
        filename: _selectedImage!.name,
      ),
    });

    if (mounted) {
      context.read<DetectImageCubit>().detectImage(formData);
    }
  }


  @override
  Widget build(BuildContext context) {
    return ImageAnalysisBlocListener(
      onLoading: () => _scanController?.repeat(reverse: true),
      onSuccess: (data) => _scanController?.stop(),
      child: BaseAnalysisPage(
        title: 'فحص الصور',
        icon: LucideIcons.scan,
        themeColor: ColorsManager.primary,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            _buildUploadPlaceholder(context),
            SizedBox(height: 32.h),
            
            // Result or Instructions
            BlocBuilder<DetectImageCubit, DetectImageState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (data) => _buildResultSection(data),
                  orElse: () => _buildInstructionsSection(),
                );
              },
            ),

            SizedBox(height: 40.h),
            Center(
              child: BlocBuilder<DetectImageCubit, DetectImageState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const SizedBox.shrink(), // Scanner handles feedback
                    success: (_) => AnimatedButton(
                      text: 'فحص صورة أخرى',
                      isPrimary: true,
                      themeColor: ColorsManager.primary,
                      onTap: _clearData,
                    ),
                    orElse: () => AnimatedButton(
                      text: 'بدء التحليل العميق',
                      isPrimary: true,
                      themeColor: ColorsManager.primary,
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
          'تعليمات الفحص',
          style: GoogleFonts.tajawal(
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 12.h),
        _buildInstructionItem(
          LucideIcons.checkCircle2,
          'ارفع صورة واضحة بتنسيق JPG أو PNG.',
        ),
        _buildInstructionItem(
          LucideIcons.checkCircle2,
          'تأكد من أن حجم الصورة لا يتجاوز 10 ميجابايت.',
        ),
        _buildInstructionItem(
          LucideIcons.checkCircle2,
          'سيقوم الذكاء الاصطناعي بتحليل البكسلات والأنماط المعمارية للصورة.',
        ),
      ],
    );
  }

  Widget _buildResultSection(data) {
    final aiProb = data.type.aiGenerated * 100;
    final isAi = aiProb > 50;

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
                'النتيجة النهائية',
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
            '${aiProb.toStringAsFixed(1)}%',
            style: GoogleFonts.tajawal(
              fontSize: 40.sp,
              fontWeight: FontWeight.w900,
              color: isAi ? ColorsManager.warning : ColorsManager.success,
            ),
          ),
          Text(
            isAi ? 'محتوى ذكاء اصطناعي محتمل' : 'محتوى بشري أصلي',
            style: GoogleFonts.tajawal(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: ColorsManager.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadPlaceholder(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            width: double.infinity,
            height: 280.h,
            decoration: BoxDecoration(
              color: ColorsManager.cardBg.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: ColorsManager.primary.withValues(alpha: 0.3),
                width: 2,
              ),
              image: _selectedImage != null
                  ? DecorationImage(
                      image: FileImage(File(_selectedImage!.path)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: _selectedImage == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LucideIcons.imagePlus,
                        color: ColorsManager.primary,
                        size: 60.r,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'اسحب الصورة هنا أو اضغط للرفع',
                        style: GoogleFonts.tajawal(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.textSecondary,
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ),
        
        // Scanner Overlay
        if (_selectedImage != null)
           BlocBuilder<DetectImageCubit, DetectImageState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => _buildScannerOverlay(),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),

        // Remove Button
        if (_selectedImage != null)
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
                  top: _scanController!.value * 280.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: ColorsManager.primary,
                      boxShadow: [
                        BoxShadow(
                          color: ColorsManager.primary,
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
                        ColorsManager.primary.withValues(alpha: 0.1),
                        ColorsManager.primary.withValues(alpha: 0.0),
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
          Icon(icon, color: ColorsManager.success, size: 20.r),
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
