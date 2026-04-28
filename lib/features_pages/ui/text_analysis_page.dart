import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theming/colors.dart';
import '../logic/detect_text_cubit.dart';
import '../logic/detect_text_state.dart';
import 'base_analysis_page.dart';
import '../../widgets/animated_button.dart';
import 'widgets/detect_analysis_bloc_listener.dart';
import '../data/models/detect_text.dart';

class TextAnalysisPage extends StatefulWidget {
  const TextAnalysisPage({super.key});

  @override
  State<TextAnalysisPage> createState() => _TextAnalysisPageState();
}

class _TextAnalysisPageState extends State<TextAnalysisPage> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  int _wordCount = 0;
  int _charCount = 0;
  AnimationController? _scanController;

  @override
  void initState() {
    super.initState();
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _textController.addListener(_updateStats);
  }

  @override
  void dispose() {
    _scanController?.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _updateStats() {
    final text = _textController.text.trim();
    setState(() {
      _charCount = text.length;
      _wordCount = text.isEmpty ? 0 : text.split(RegExp(r'\s+')).length;
    });
  }

  void _clearData() {
    _textController.clear();
    context.read<DetectTextCubit>().emit(const DetectTextState.initial());
    _scanController?.stop();
  }

  void _submitAnalysis() {
    if (_textController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'يرجى إدخال النص المراد فحصه أولاً',
            style: GoogleFonts.tajawal(),
          ),
          backgroundColor: ColorsManager.warning,
        ),
      );
      return;
    }

    context.read<DetectTextCubit>().detectText({
      'text': _textController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return DetectAnalysisBlocListener(
      onLoading: () => _scanController?.repeat(reverse: true),
      onSuccess: (data) => _scanController?.stop(),
      child: BaseAnalysisPage(
        title: 'التأكد من النصوص',
        icon: LucideIcons.messageSquare,
        themeColor: ColorsManager.accent,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            _buildInfoCard(),
            SizedBox(height: 32.h),
            _buildTextInputField(),
            SizedBox(height: 24.h),
            _buildQuickStats(),
            SizedBox(height: 40.h),
            
            // Results or Button Area
            BlocBuilder<DetectTextCubit, DetectTextState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (data) => _buildResultsDashboard(data),
                  loading: () => const SizedBox.shrink(),
                  orElse: () => Center(
                    child: AnimatedButton(
                      text: 'تحليل النص الآن',
                      isPrimary: true,
                      themeColor: ColorsManager.accent,
                      onTap: _submitAnalysis,
                    ),
                  ),
                );
              },
            ),

            // Post-analysis buttons
            BlocBuilder<DetectTextCubit, DetectTextState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (_) => Column(
                    children: [
                      SizedBox(height: 40.h),
                      Center(
                        child: AnimatedButton(
                          text: 'بدء تحليل جديد',
                          isPrimary: false,
                          themeColor: ColorsManager.accent,
                          onTap: _clearData,
                        ),
                      ),
                    ],
                  ),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
            
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsManager.accent.withValues(alpha: 0.15),
            ColorsManager.accent.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: ColorsManager.accent.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: ColorsManager.accent.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(LucideIcons.info, color: ColorsManager.accent, size: 24.r),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'المساعد الذكي لفحص النصوص',
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'سيقوم الذكاء الاصطناعي بتحليل النص واكتشاف المحتوى الضار أو غير الأخلاقي بدقة عالية.',
                  style: GoogleFonts.tajawal(
                    fontSize: 12.sp,
                    color: ColorsManager.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextInputField() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.w, bottom: 12.h),
              child: Text(
                'نص التحليل',
                style: GoogleFonts.tajawal(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.textSecondary,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorsManager.cardBg.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(
                  color: ColorsManager.accent.withValues(alpha: 0.3),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.accent.withValues(alpha: 0.05),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: TextField(
                controller: _textController,
                maxLines: 10,
                style: GoogleFonts.tajawal(
                  fontSize: 15.sp,
                  color: Colors.white,
                  height: 1.6,
                ),
                decoration: InputDecoration(
                  hintText: 'ألصق النص المراد فحصه هنا...',
                  hintStyle: GoogleFonts.tajawal(
                    fontSize: 14.sp,
                    color: ColorsManager.textSecondary.withValues(alpha: 0.4),
                  ),
                  contentPadding: EdgeInsets.all(24.r),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        
        // Scanning Overlay
        BlocBuilder<DetectTextCubit, DetectTextState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.r),
                    child: AnimatedBuilder(
                      animation: _scanController!,
                      builder: (context, child) {
                        return Stack(
                          children: [
                            Positioned(
                              top: _scanController!.value * 240.h,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 4.h,
                                decoration: BoxDecoration(
                                  color: ColorsManager.accent,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorsManager.accent,
                                      blurRadius: 20,
                                      spreadRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                               decoration: BoxDecoration(
                                 gradient: LinearGradient(
                                   begin: Alignment.topCenter,
                                   end: Alignment.bottomCenter,
                                   colors: [
                                     ColorsManager.accent.withValues(alpha: 0.1),
                                     Colors.transparent,
                                   ],
                                   stops: [_scanController!.value, (_scanController!.value + 0.1).clamp(0, 1)],
                                 ),
                               ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildQuickStats() {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: ColorsManager.cardBg.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: ColorsManager.borderDark),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(_wordCount.toString(), 'كلمة', LucideIcons.fileText),
          _buildVerticalDivider(),
          _buildStatItem(_charCount.toString(), 'حرف', LucideIcons.type),
          _buildVerticalDivider(),
          _buildStatItem('AI-V1', 'المحرك', LucideIcons.cpu),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 30.h,
      width: 1,
      color: ColorsManager.borderDark,
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: ColorsManager.accent, size: 18.r),
        SizedBox(height: 8.h),
        Text(
          value,
          style: GoogleFonts.tajawal(
            fontSize: 18.sp,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.tajawal(
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildResultsDashboard(DetectText data) {
    // Default values if scores are null (simulated for demo if needed)
    final toxicity = data.scores?.toxicity ?? 0;
    final profanity = data.scores?.profanity ?? 0;
    final hateSpeech = data.scores?.hateSpeech ?? 0;
    final sexual = data.scores?.sexual ?? 0;
    final threat = data.scores?.threat ?? 0;

    final isHarmful = toxicity > 0.7 || profanity > 0.7 || hateSpeech > 0.7 || threat > 0.7;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isHarmful) _buildGlobalWarning(),
        SizedBox(height: 24.h),
        Text(
          'نتائج التحليل العميق',
          style: GoogleFonts.tajawal(
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20.h),
        _buildMetricCard(
          'مستوى السمية',
          'Toxicity Score',
          toxicity,
          LucideIcons.flame,
        ),
        _buildMetricCard(
          'اكتشاف الشتائم',
          'Profanity Detection',
          profanity,
          LucideIcons.messageSquare,
        ),
        _buildMetricCard(
          'خطاب الكراهية',
          'Hate Speech Risk',
          hateSpeech,
          LucideIcons.users,
        ),
        _buildMetricCard(
          'محتوى غير لائق',
          'Sexual Content',
          sexual,
          LucideIcons.heartPulse,
        ),
        _buildMetricCard(
          'مستوى التهديد',
          'Threat Level',
          threat,
          LucideIcons.shieldAlert,
        ),
        
        if (data.personal.matches.isNotEmpty) ...[
          SizedBox(height: 24.h),
          _buildListMatches('البيانات الشخصية', data.personal.matches, Colors.orange, LucideIcons.userX),
        ],
        if (data.link.matches.isNotEmpty) ...[
          SizedBox(height: 16.h),
          _buildListMatches('الروابط المكتشفة', data.link.matches, ColorsManager.primary, LucideIcons.link),
        ],
      ],
    );
  }

  Widget _buildGlobalWarning() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: ColorsManager.warning.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: ColorsManager.warning.withValues(alpha: 0.5), width: 2),
      ),
      child: Row(
        children: [
          Icon(LucideIcons.alertTriangle, color: ColorsManager.warning, size: 32.r),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تحذير: محتوى ضار!',
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w900,
                    color: ColorsManager.warning,
                  ),
                ),
                Text(
                  'لقد اكتشف النظام مؤشرات عالية لمحتوى ينتهك سياسات الاستخدام.',
                  style: GoogleFonts.tajawal(
                    fontSize: 12.sp,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String subtitle, double value, IconData icon) {
    Color getStatusColor(double v) {
      if (v < 0.3) return ColorsManager.success;
      if (v < 0.7) return Colors.orange;
      return ColorsManager.warning;
    }

    final color = getStatusColor(value);

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: ColorsManager.cardBg.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: ColorsManager.borderDark),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(icon, color: color, size: 20.r),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.tajawal(
                        fontSize: 10.sp,
                        color: ColorsManager.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${(value * 100).toInt()}%',
                style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w900,
                  color: color,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Stack(
            children: [
              Container(
                height: 8.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsManager.borderDark,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeOutCirc,
                tween: Tween<double>(begin: 0, end: value),
                builder: (context, val, child) {
                  return Container(
                    height: 8.h,
                    width: (MediaQuery.of(context).size.width - 110.w) * val,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(4.r),
                      boxShadow: [
                        BoxShadow(
                          color: color.withValues(alpha: 0.5),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListMatches(String title, List<TextMatchItem> matches, Color color, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 18.r),
            SizedBox(width: 8.w),
            Text(
              title,
              style: GoogleFonts.tajawal(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: matches.map((m) => Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: color.withValues(alpha: 0.3)),
            ),
            child: Text(
              m.match ?? m.type ?? 'Unspecified',
              style: GoogleFonts.tajawal(
                fontSize: 11.sp,
                color: Colors.white,
              ),
            ),
          )).toList(),
        ),
      ],
    );
  }
}
