import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../routing/routes.dart';
import '../../theming/colors.dart';
import 'base_analysis_page.dart';

class HistorySelectorPage extends StatelessWidget {
  const HistorySelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAnalysisPage(
      title: 'سجلات الفحص',
      icon: LucideIcons.history,
      themeColor: ColorsManager.accent,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text(
            'اختر نوع السجل الذي ترغب في استعراضه',
            style: GoogleFonts.tajawal(
              fontSize: 16.sp,
              color: ColorsManager.textSecondary,
            ),
          ),
          SizedBox(height: 30.h),
          _buildHistoryOption(
            context,
            title: 'سجل الصور',
            subtitle: 'استعراض كافة نتائج فحص الصور السابقة',
            icon: LucideIcons.image,
            color: ColorsManager.primary,
            route: Routes.imageHistoryPage,
          ),
          SizedBox(height: 16.h),
          _buildHistoryOption(
            context,
            title: 'سجل الفيديو',
            subtitle: 'استعراض كافة نتائج فحص الفيديو السابقة',
            icon: LucideIcons.video,
            color: ColorsManager.warning,
            route: Routes.videoHistoryPage,
          ),
          SizedBox(height: 16.h),
          _buildHistoryOption(
            context,
            title: 'سجل النصوص',
            subtitle: 'استعراض كافة نتائج فحص النصوص السابقة',
            icon: LucideIcons.fileText,
            color: ColorsManager.success,
            route: Routes.textHistoryPage,
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required String route,
  }) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: ColorsManager.cardBg,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: color.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Icon(icon, color: color, size: 28.r),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.tajawal(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: GoogleFonts.tajawal(
                      fontSize: 13.sp,
                      color: ColorsManager.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              LucideIcons.chevronLeft,
              color: Colors.white24,
              size: 20.r,
            ),
          ],
        ),
      ),
    );
  }
}
