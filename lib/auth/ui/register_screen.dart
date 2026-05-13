import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../routing/routes.dart';
import '../../theming/colors.dart';
import '../../widgets/custom_text_form_field.dart';
import '../logic/register_cubit.dart';
import 'widgets/login_bloc_listener.dart';
import 'widgets/register_bloc_listener.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorsManager.bgStart, ColorsManager.bgEnd],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Form(
              key: fromKey,
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  Text(
                    "إنشاء حساب",
                    style: GoogleFonts.tajawal(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w800,
                      color: ColorsManager.primary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "انضم إلينا واستفد من تقنيات الفحص المتقدمة",
                    style: GoogleFonts.tajawal(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.textSecondary,
                    ),
                  ),
                  SizedBox(height: 50.h),
                  CustomTextFormField(
                    controller: emailController,
                    label: "البريد الالكتروني",
                    hintText: "أدخل بريدك الالكتروني",
                    keyboardType: TextInputType.emailAddress,
                    isRequired: true,
                    prefixIcon: Icon(
                      LucideIcons.mail,
                      color: ColorsManager.textSecondary,
                      size: 22.sp,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "هذا الحقل مطلوب";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    controller: passwordController,
                    label: "كلمة المرور",
                    hintText: "أدخل كلمة المرور",
                    keyboardType: TextInputType.text,
                    isObscureText: true,
                    isRequired: true,
                    prefixIcon: Icon(
                      LucideIcons.lock,
                      color: ColorsManager.textSecondary,
                      size: 22.sp,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "هذا الحقل مطلوب";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "بإنشاء لحساب فإنك توافق على ",
                            style: GoogleFonts.tajawal(
                              color: ColorsManager.textSecondary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "الشروط والاحكام و سياسة الخصوصية",
                            style: GoogleFonts.tajawal(
                              color: ColorsManager.primary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(
                    height: 56.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.primary,
                        foregroundColor: ColorsManager.bgEnd,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      onPressed: () {
                        if (fromKey.currentState!.validate()) {
                          context.read<RegisterCubit>().register({
                            "email": emailController.text.trim(),
                            "password": passwordController.text.trim(),
                          });
                        }
                      },
                      child: Text(
                        "إنشاء حساب",
                        style: GoogleFonts.tajawal(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "لديك حساب بالفعل ؟ ",
                            style: GoogleFonts.tajawal(
                              color: ColorsManager.textSecondary,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "تسجيل الدخول",
                            style: GoogleFonts.tajawal(
                              color: ColorsManager.primary,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.loginScreen,
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  RegisterBlocListener(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  LoginBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
