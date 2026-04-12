import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theming/colors.dart';
import 'feature_card.dart';

import '../features_pages/ui/image_analysis_page.dart';
import '../features_pages/ui/video_analysis_page.dart';
import '../features_pages/ui/voice_analysis_page.dart';
import '../features_pages/ui/text_analysis_page.dart';

class FeaturesGrid extends StatelessWidget {
  const FeaturesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        'title': 'فحص الصور',
        'desc': 'اكتشف هل الصورة مُولدة بنماذج الذكاء الاصطناعي بدقة عالية.',
        'icon': LucideIcons.scan,
        'color': ColorsManager.primary,
        'page': ImageAnalysisPage(),
      },
      {
        'title': 'تحليل الفيديو والتزييف',
        'desc': 'حلّل إطارات الفيديو لكشف التزييف العميق (Deepfake) بشكل فوري.',
        'icon': LucideIcons.video,
        'color': ColorsManager.warning,
        'page': const VideoAnalysisPage(),
      },
      {
        'title': 'فحص الأصوات',
        'desc': 'اكتشف الأصوات المُستنسخة والمقلدة بدقة تفوق الأذن البشرية.',
        'icon': LucideIcons.mic,
        'color': ColorsManager.highlight,
        'page': const VoiceAnalysisPage(),
      },
      {
        'title': 'التأكد من النصوص',
        'desc': 'تعرّف على النصوص المسيئة أو المولدّة عبر ChatGPT للتحايل.',
        'icon': LucideIcons.messageSquare,
        'color': ColorsManager.accent,
        'page': const TextAnalysisPage(),
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        children: features
            .map(
              (f) => Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: FeatureCard(
                  title: f['title'] as String,
                  description: f['desc'] as String,
                  icon: f['icon'] as IconData,
                  color: f['color'] as Color,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => f['page'] as Widget,
                      ),
                    );
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}