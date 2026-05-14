import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theming/colors.dart';

class HomeLogo extends StatelessWidget {
  const HomeLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100.r,
          height: 100.r,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManager.cardBg,
            border: Border.all(
              color: ColorsManager.primary.withOpacity(0.4),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorsManager.primary.withOpacity(0.25),
                blurRadius: 30,
                spreadRadius: -3,
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 14.h),

        Text(
          'VerityAI\nدرع الذكاء الاصطناعي',
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
    );
  }
}