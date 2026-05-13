import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../theming/colors.dart';
import '../logic/histories_image_cubit.dart';
import '../logic/histories_image_state.dart';
import '../data/models/histories_image.dart';
import 'base_analysis_page.dart';

class ImageHistoryPage extends StatelessWidget {
  const ImageHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAnalysisPage(
      title: 'سجل فحص الصور',
      icon: LucideIcons.image,
      themeColor: ColorsManager.primary,
      content: BlocBuilder<HistoriesImageCubit, HistoriesImageState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(color: ColorsManager.primary),
            ),
            success: (histories) => _buildHistoryList(histories),
            error: (error) => Center(
              child: Text(
                'حدث خطأ أثناء تحميل السجل',
                style: GoogleFonts.tajawal(color: Colors.red),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHistoryList(List<HistoriesImage> histories) {
    if (histories.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Icon(LucideIcons.history, size: 64.r, color: Colors.white24),
            SizedBox(height: 16.h),
            Text(
              'لا يوجد سجلات سابقة',
              style: GoogleFonts.tajawal(
                fontSize: 16.sp,
                color: ColorsManager.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: histories.length,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        final item = histories[index];
        return _buildHistoryItem(item);
      },
    );
  }

  Widget _buildHistoryItem(HistoriesImage item) {
    final aiProb = item.type.aiGenerated * 100;
    final isAi = aiProb > 50;
    final date = DateTime.parse(item.createdAt);
    final formattedDate = DateFormat('yyyy/MM/dd - hh:mm a').format(date);

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: ColorsManager.cardBg,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: (isAi ? ColorsManager.warning : ColorsManager.success)
              .withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 70.r,
            height: 70.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: NetworkImage(item.media.uri),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isAi ? 'محتوى ذكاء اصطناعي' : 'محتوى أصلي',
                  style: GoogleFonts.tajawal(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                    color: isAi ? ColorsManager.warning : ColorsManager.success,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  formattedDate,
                  style: GoogleFonts.tajawal(
                    fontSize: 12.sp,
                    color: ColorsManager.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${aiProb.toStringAsFixed(1)}%',
                style: GoogleFonts.tajawal(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              Text(
                'نسبة الشك',
                style: GoogleFonts.tajawal(
                  fontSize: 10.sp,
                  color: ColorsManager.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
