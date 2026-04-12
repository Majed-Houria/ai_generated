import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theming/colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: ColorsManager.cardBg.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ColorsManager.borderDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.info, color: ColorsManager.highlight, size: 24.r),
              SizedBox(width: 10.w),
              Text(
                'عن المنصة',
                style: GoogleFonts.tajawal(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: ColorsManager.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            'نحارب الاحتيال الرقمي من خلال توفير تقنيات متطورة للصحفيين والمستخدمين للتبين من المحتوى المصطنع. خوارزمياتنا معتمدة ومدربة لتوفير أعلى نسبة دقة في الفحص.',
            style: GoogleFonts.tajawal(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: ColorsManager.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
