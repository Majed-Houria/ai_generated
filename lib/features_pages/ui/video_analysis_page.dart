import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theming/colors.dart';
import 'base_analysis_page.dart';
import '../../widgets/animated_button.dart';

class VideoAnalysisPage extends StatelessWidget {
  const VideoAnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAnalysisPage(
      title: 'تحليل الفيديو والتزييف',
      icon: LucideIcons.video,
      themeColor: ColorsManager.warning,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          _buildVideoPlaceholder(context),
          SizedBox(height: 32.h),
          Text(
            'معايير الكشف (Deepfake)',
            style: GoogleFonts.tajawal(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.h),
          _buildMetricRow('تزامن الشفاه', 0.85, ColorsManager.success),
          _buildMetricRow('ترميش العين', 0.42, ColorsManager.warning),
          _buildMetricRow('دقة الحواف', 0.91, ColorsManager.success),
          SizedBox(height: 40.h),
          Center(
            child: AnimatedButton(
              text: 'تحليل الإطارات',
              isPrimary: true,
              themeColor: ColorsManager.warning,
              onTap: () {},
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildVideoPlaceholder(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220.h,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: ColorsManager.warning.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            LucideIcons.playCircle,
            color: ColorsManager.warning.withValues(alpha: 0.8),
            size: 80.r,
          ),
          Positioned(
            bottom: 20.h,
            child: Text(
              'اختر ملف فيديو لفحصه',
              style: GoogleFonts.tajawal(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ColorsManager.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricRow(String label, double value, Color color) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: GoogleFonts.tajawal(
                  fontSize: 14.sp,
                  color: ColorsManager.textPrimary,
                ),
              ),
              Text(
                '${(value * 100).toInt()}%',
                style: GoogleFonts.tajawal(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: ColorsManager.borderDark,
              color: color,
              minHeight: 8.h,
            ),
          ),
        ],
      ),
    );
  }
}
