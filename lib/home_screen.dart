import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFEFF),
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Color(0xFFFAFEFF),
        foregroundColor: Color(0xFFFAFEFF),
        backgroundColor: Color(0xFFFAFEFF),
        title: Text(
          "الرئيسية",
          style: GoogleFonts.tajawal(
            fontSize: 26.sp,
            fontWeight: FontWeight.w700,
            color: Color(0xFFdab135),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
