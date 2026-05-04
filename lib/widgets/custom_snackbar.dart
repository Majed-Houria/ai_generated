import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSnackbar {
  static void show(
      BuildContext context, {
        required String message,
        IconData icon = Icons.info,
        Color backgroundColor = const Color(0xFF323232),
        Color textColor = Colors.white,
        Duration duration = const Duration(seconds: 3),
      }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    final animationController = AnimationController(
      duration: const Duration(milliseconds: 350),
      reverseDuration: const Duration(milliseconds: 250),
      vsync: Navigator.of(context),
    );

    final slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    final fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    entry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 70.h,
        left: 16.w,
        right: 16.w,
        child: SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(icon, color: textColor, size: 22.sp),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        message,
                        style: GoogleFonts.tajawal(
                          color: textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);

    animationController.forward();

    Future.delayed(duration, () {
      animationController.reverse().then((value) {
        entry.remove();
        animationController.dispose();
      });
    });
  }
}
