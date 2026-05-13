import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../routing/routes.dart';
import '../theming/colors.dart';
import 'animated_button.dart';

class HeroSection extends StatelessWidget {
  final Animation<double> floatAnimation;
  final VoidCallback onStartScan;

  const HeroSection({
    super.key,
    required this.floatAnimation,
    required this.onStartScan,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: ColorsManager.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: ColorsManager.primary.withValues(alpha: 0.3)),
            boxShadow: [
              BoxShadow(
                color: ColorsManager.primary.withValues(alpha: 0.15),
                blurRadius: 15,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                animation: floatAnimation,
                builder: (context, child) {
                  return Container(
                    width: 8.r,
                    height: 8.r,
                    decoration: BoxDecoration(
                      color: ColorsManager.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: ColorsManager.primary,
                          blurRadius:
                              8 +
                              (math.sin(floatAnimation.value * math.pi) * 4),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(width: 10.w),
              Text(
                'الشبكة العصبونية جاهزة للتحليل',
                style: GoogleFonts.tajawal(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.primary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          'اكتشف المحتوى المُولّد\nبالذكاء الاصطناعي فوراً',
          textAlign: TextAlign.center,
          style: GoogleFonts.tajawal(
            fontSize: 28.sp,
            fontWeight: FontWeight.w900,
            height: 1.3,
            color: ColorsManager.textPrimary,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'منصة قوية وموثوقة للتحقق من مصداقية المحتوى الرقمي. اكتشف الصور الوهمية، الفيديوهات المزيفة (Deepfake)، الأصوات المقلدة، والنصوص المسيئة باستخدام أحدث خوارزميات التعلم العميق.',
          textAlign: TextAlign.center,
          style: GoogleFonts.tajawal(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.textSecondary,
            height: 1.6,
          ),
        ),
        SizedBox(height: 32.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedButton(
              text: 'ابدأ الفحص',
              isPrimary: true,
              themeColor: ColorsManager.primary,
              onTap: onStartScan,
            ),
            SizedBox(width: 16.w),
            AnimatedButton(
              text: 'السجل السابق',
              isPrimary: false,
              themeColor: ColorsManager.accent,
              onTap: () => Navigator.pushNamed(context, Routes.historySelectorPage),
            ),
          ],
        ),
      ],
    );
  }
}
