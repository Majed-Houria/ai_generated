import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theming/colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.tajawal(
            fontSize: 22.sp,
            fontWeight: FontWeight.w800,
            color: ColorsManager.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: 50.w,
          height: 3.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.r),
            gradient: const LinearGradient(
              colors: [ColorsManager.primary, ColorsManager.highlight],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
        ),
      ],
    );
  }
}
