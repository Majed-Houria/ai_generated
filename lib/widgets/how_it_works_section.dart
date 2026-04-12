import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'dart:math' as math;
import '../theming/colors.dart';

class HowItWorksSection extends StatelessWidget {
  final Animation<double> floatAnimation;

  const HowItWorksSection({super.key, required this.floatAnimation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStep(
            LucideIcons.uploadCloud,
            'الرفع',
            'الملف أو النص',
            ColorsManager.primary,
          ),
          _buildStepLine(),
          _buildStep(
            LucideIcons.cpu,
            'التحليل',
            'معالجة ذكية',
            ColorsManager.highlight,
          ),
          _buildStepLine(),
          _buildStep(
            LucideIcons.shieldCheck,
            'النتائج',
            'تقارير الموثوقية',
            ColorsManager.success,
          ),
        ],
      ),
    );
  }

  Widget _buildStepLine() {
    return Expanded(
      child: Container(
        height: 2.h,
        margin: EdgeInsets.only(top: 24.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              ColorsManager.borderDark,
              ColorsManager.accent.withValues(alpha: 0.5)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(IconData icon, String title, String sub, Color glowColor) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Container(
            width: 54.r,
            height: 54.r,
            decoration: BoxDecoration(
              color: ColorsManager.cardBg,
              shape: BoxShape.circle,
              border: Border.all(color: ColorsManager.borderDark),
              boxShadow: [
                BoxShadow(
                  color: glowColor.withValues(alpha: 0.15),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: AnimatedBuilder(
              animation: floatAnimation,
              builder: (context, child) {
                return Icon(
                  icon,
                  color: glowColor,
                  size: 24.r + (math.sin(floatAnimation.value * math.pi) * 2),
                );
              },
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
              fontSize: 13.sp,
              fontWeight: FontWeight.w800,
              color: ColorsManager.textPrimary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            sub,
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: ColorsManager.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
