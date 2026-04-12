import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theming/colors.dart';
import 'base_analysis_page.dart';
import '../../widgets/animated_button.dart';

class TextAnalysisPage extends StatelessWidget {
  const TextAnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAnalysisPage(
      title: 'التأكد من النصوص',
      icon: LucideIcons.messageSquare,
      themeColor: ColorsManager.accent,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Text(
            'أدخل النص المراد فحصه:',
            style: GoogleFonts.tajawal(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManager.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            decoration: BoxDecoration(
              color: ColorsManager.cardBg.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: ColorsManager.accent.withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            child: TextField(
              maxLines: 10,
              style: GoogleFonts.tajawal(
                fontSize: 14.sp,
                color: Colors.white,
                height: 1.6,
              ),
              decoration: InputDecoration(
                hintText: 'ألصق النص هنا لمقارنته بنماذج الذكاء الاصطناعي...',
                hintStyle: GoogleFonts.tajawal(
                  fontSize: 14.sp,
                  color: ColorsManager.textSecondary.withValues(alpha: 0.5),
                ),
                contentPadding: EdgeInsets.all(20.r),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          _buildQuickStats(),
          SizedBox(height: 40.h),
          Center(
            child: AnimatedButton(
              text: 'فحص الاحتمالية الرقمية',
              isPrimary: true,
              themeColor: ColorsManager.accent,
              onTap: () {},
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: ColorsManager.accent.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.accent.withValues(alpha: 0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatCircle('0', 'كلمات'),
          _buildStatCircle('0', 'حروف'),
          _buildStatCircle('0%', 'دقة GPT'),
        ],
      ),
    );
  }

  Widget _buildStatCircle(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.tajawal(
            fontSize: 18.sp,
            fontWeight: FontWeight.w900,
            color: ColorsManager.accent,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.tajawal(
            fontSize: 11.sp,
            color: ColorsManager.textSecondary,
          ),
        ),
      ],
    );
  }
}
