import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'dart:math' as math;
import '../theming/colors.dart';

class HomeLogo extends StatelessWidget {
  final Animation<double> floatAnimation;
  final Animation<double> scanAnimation;

  const HomeLogo({
    super.key,
    required this.floatAnimation,
    required this.scanAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: floatAnimation,
      builder: (context, child) {
        final floatY = math.sin(floatAnimation.value * math.pi) * 8;
        return Transform.translate(
          offset: Offset(0, floatY),
          child: Column(
            children: [
              Container(
                width: 70.r,
                height: 70.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.cardBg,
                  border: Border.all(
                    color: ColorsManager.primary.withValues(alpha: 0.4),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsManager.primary.withValues(alpha: 0.3),
                      blurRadius: 20,
                      spreadRadius: -2,
                    ),
                  ],
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      RotationTransition(
                        turns: scanAnimation,
                        child: Icon(
                          LucideIcons.loader,
                          color: ColorsManager.highlight.withValues(alpha: 0.3),
                          size: 45.r,
                        ),
                      ),
                      Icon(
                        LucideIcons.scanFace,
                        color: ColorsManager.primary,
                        size: 30.r,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'VerifyAI\nدرع الذكاء الاصطناعي',
                textAlign: TextAlign.center,
                style: GoogleFonts.tajawal(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  height: 1.3,
                  color: ColorsManager.textPrimary,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
