import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../theming/colors.dart';
import '../logic/histories_text_cubit.dart';
import '../logic/histories_text_state.dart';
import '../data/models/histories_text.dart';
import 'base_analysis_page.dart';

class TextHistoryPage extends StatelessWidget {
  const TextHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAnalysisPage(
      title: 'سجل فحص النصوص',
      icon: LucideIcons.fileText,
      themeColor: ColorsManager.success,
      content: RefreshIndicator(
        onRefresh: () => context.read<HistoriesTextCubit>().historiesText(),
        color: ColorsManager.success,
        child: BlocBuilder<HistoriesTextCubit, HistoriesTextState>(
          builder: (context, state) {
            return state.when(
              initial: () {
                context.read<HistoriesTextCubit>().historiesText();
                return const Center(child: CircularProgressIndicator());
              },
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: CircularProgressIndicator(color: ColorsManager.success),
                ),
              ),
              success: (histories) => _buildHistoryList(histories),
              error: (error) => Center(
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    const Icon(LucideIcons.alertCircle, color: Colors.red, size: 40),
                    SizedBox(height: 10.h),
                    Text(
                      'حدث خطأ أثناء تحميل السجل',
                      style: GoogleFonts.tajawal(color: Colors.red),
                    ),
                    TextButton(
                      onPressed: () => context.read<HistoriesTextCubit>().historiesText(),
                      child: const Text('إعادة المحاولة'),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHistoryList(List<HistoriesText> histories) {
    if (histories.isEmpty) {
      return ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 100.h),
          Center(
            child: Column(
              children: [
                Icon(LucideIcons.history, size: 64.r, color: Colors.white24),
                SizedBox(height: 16.h),
                Text(
                  'لا يوجد سجلات نصوص سابقة',
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    color: ColorsManager.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
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

  Widget _buildHistoryItem(HistoriesText item) {
    final date = DateTime.parse(item.createdAt);
    final formattedDate = DateFormat('yyyy/MM/dd - hh:mm a').format(date);
    
    // Check for toxicity or matches in raw results if applicable
    final hasProfanity = item.profanity.matches.isNotEmpty;
    final hasPersonal = item.personal.matches.isNotEmpty;
    final hasLinks = item.link.matches.isNotEmpty;
    
    final isToxic = hasProfanity || hasPersonal;
    final statusColor = isToxic ? ColorsManager.warning : ColorsManager.success;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: ColorsManager.cardBg,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: statusColor.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  isToxic ? LucideIcons.shieldAlert : LucideIcons.shieldCheck,
                  color: statusColor,
                  size: 20.r,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isToxic ? 'محتوى يحتاج مراجعة' : 'محتوى آمن',
                      style: GoogleFonts.tajawal(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w800,
                        color: statusColor,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: GoogleFonts.tajawal(
                        fontSize: 11.sp,
                        color: ColorsManager.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            item.text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.tajawal(
              fontSize: 14.sp,
              color: Colors.white,
              height: 1.4,
            ),
          ),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              if (hasProfanity) _buildBadge('كلام بذيء', Colors.red),
              if (hasPersonal) _buildBadge('بيانات شخصية', Colors.orange),
              if (hasLinks) _buildBadge('روابط خارجية', Colors.blue),
              if (!isToxic && !hasLinks) _buildBadge('نظيف', ColorsManager.success),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.tajawal(
          fontSize: 10.sp,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}
