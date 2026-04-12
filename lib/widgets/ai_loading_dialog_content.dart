import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theming/colors.dart';
import 'animated_button.dart';

class AILoadingDialogContent extends StatelessWidget {
  const AILoadingDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.r),
      decoration: BoxDecoration(
        color: ColorsManager.cardBg.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: ColorsManager.primary.withValues(alpha: 0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.primary.withValues(alpha: 0.2),
            blurRadius: 40,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Custom Scanner Loader
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80.r,
                height: 80.r,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(ColorsManager.accent),
                  strokeWidth: 3,
                ),
              ),
              Icon(LucideIcons.cpu, color: ColorsManager.highlight, size: 30.r),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            'جاري التهيئة والتحليل...',
            style: GoogleFonts.tajawal(
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
              color: ColorsManager.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'يتم الآن فحص البصمة الرقمية عبر الخوارزميات',
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
              fontSize: 12.sp,
              color: ColorsManager.textSecondary,
            ),
          ),
          SizedBox(height: 24.h),
          AnimatedButton(
            text: 'إلغاء',
            isPrimary: false,
            themeColor: ColorsManager.warning,
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
