import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theming/colors.dart';
import '../../widgets/animated_button.dart';
import 'base_analysis_page.dart';
import 'dart:math' as math;

class VoiceAnalysisPage extends StatelessWidget {
  const VoiceAnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAnalysisPage(
      title: 'فحص الأصوات',
      icon: LucideIcons.mic,
      themeColor: ColorsManager.highlight,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          _buildWaveformPlaceholder(),
          SizedBox(height: 50.h),
          Text(
            'تحليل البصمة الصوتية',
            style: GoogleFonts.tajawal(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'قم برفع ملف صوتي أو تسجيل مقطع لاكتشاف علامات التلاعب الرقمي واستنساخ البروتينات الصوتية.',
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
              fontSize: 14.sp,
              color: ColorsManager.textSecondary,
              height: 1.6,
            ),
          ),
          SizedBox(height: 50.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRoundAction(LucideIcons.mic, 'تسجيل مباشر', ColorsManager.highlight),
              SizedBox(width: 30.w),
              _buildRoundAction(LucideIcons.upload, 'رفع ملف', ColorsManager.primary),
            ],
          ),
          SizedBox(height: 50.h),
          AnimatedButton(
            text: 'تحليل البصمة الرقمية',
            isPrimary: true,
            themeColor: ColorsManager.highlight,
            onTap: () {},
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildWaveformPlaceholder() {
    return Container(
      height: 120.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(25, (index) {
          final height = 20 + math.Random().nextInt(80).toDouble();
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            width: 4.w,
            height: height.h,
            decoration: BoxDecoration(
              color: ColorsManager.highlight.withValues(
                alpha: (index / 25).clamp(0.2, 1.0),
              ),
              borderRadius: BorderRadius.circular(2.r),
              boxShadow: [
                BoxShadow(
                  color: ColorsManager.highlight.withValues(alpha: 0.3),
                  blurRadius: 8,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildRoundAction(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 70.r,
          height: 70.r,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(color: color.withValues(alpha: 0.4), width: 2),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.2),
                blurRadius: 15,
                spreadRadius: -5,
              ),
            ],
          ),
          child: Icon(icon, color: color, size: 28.r),
        ),
        SizedBox(height: 12.h),
        Text(
          label,
          style: GoogleFonts.tajawal(
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            color: ColorsManager.textPrimary,
          ),
        ),
      ],
    );
  }
}
