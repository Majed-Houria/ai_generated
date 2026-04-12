import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theming/colors.dart';

class ScannerMockup extends StatelessWidget {
  final Animation<double> scanLineAnimation;

  const ScannerMockup({super.key, required this.scanLineAnimation});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140.h,
      decoration: BoxDecoration(
        color: ColorsManager.cardBg.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ColorsManager.highlight.withValues(alpha: 0.3)),
      ),
      child: Stack(
        children: [
          Center(
            child:
                Icon(LucideIcons.image, size: 60.r, color: ColorsManager.borderDark),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LucideIcons.fileText, size: 50.r, color: ColorsManager.borderDark),
                SizedBox(width: 40.w),
                Icon(LucideIcons.mic, size: 50.r, color: ColorsManager.borderDark),
              ],
            ),
          ),

          // Moving Scanning Line
          AnimatedBuilder(
            animation: scanLineAnimation,
            builder: (context, child) {
              final position = scanLineAnimation.value * 140.h;
              return Positioned(
                top: position,
                left: 0,
                right: 0,
                child: Container(
                  height: 3.h,
                  decoration: BoxDecoration(
                    color: ColorsManager.accent,
                    boxShadow: [
                      BoxShadow(
                        color: ColorsManager.accent,
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                      BoxShadow(color: ColorsManager.textPrimary, blurRadius: 5),
                    ],
                  ),
                ),
              );
            },
          ),

          // Overlay gradient for depth
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorsManager.bgStart.withValues(alpha: 0.1),
                    ColorsManager.bgStart.withValues(alpha: 0.6),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
