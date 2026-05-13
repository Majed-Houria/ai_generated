import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../theming/colors.dart';
import '../logic/histories_video_cubit.dart';
import '../logic/histories_video_state.dart';
import '../data/models/histories_video.dart';
import 'base_analysis_page.dart';

class VideoHistoryPage extends StatelessWidget {
  const VideoHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAnalysisPage(
      title: 'سجل فحص الفيديو',
      icon: LucideIcons.video,
      themeColor: ColorsManager.warning,
      content: BlocBuilder<HistoriesVideoCubit, HistoriesVideoState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(color: ColorsManager.warning),
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

  Widget _buildHistoryList(List<HistoriesVideo> histories) {
    if (histories.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Icon(LucideIcons.history, size: 64.r, color: Colors.white24),
            SizedBox(height: 16.h),
            Text(
              'لا يوجد سجلات فيديوهات سابقة',
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

  Widget _buildHistoryItem(HistoriesVideo item) {
    final aiProb = item.aiScore * 100;
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
              color: ColorsManager.warning.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(LucideIcons.playCircle, color: ColorsManager.warning, size: 32.r),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isAi ? 'فيديو مزيف' : 'فيديو أصلي',
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
                SizedBox(height: 4.h),
                Text(
                  '${item.data.frames.length} إطارات تم فحصها',
                  style: GoogleFonts.tajawal(
                    fontSize: 11.sp,
                    color: Colors.white54,
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
