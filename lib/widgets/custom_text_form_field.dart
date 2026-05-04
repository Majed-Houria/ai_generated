import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theming/colors.dart';

class CustomTextFormField<T> extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? label;
  final bool isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final int maxLines;
  final bool enabled;
  final void Function(String)? onChanged;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final bool isRequired;
  final TextInputAction textInputAction;
  final void Function(String)? onFieldSubmitted;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.label,
    this.isObscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.maxLines = 1,
    this.enabled = true,
    this.onChanged,
    this.readOnly = false,
    this.inputFormatters,
    this.isRequired = false,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: RichText(
              text: TextSpan(
                text: label!,
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: ColorsManager.textPrimary,
                ),
                children: [
                  if (isRequired)
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: ColorsManager.warning,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
          ),
        TextSelectionTheme(
          data: TextSelectionThemeData(
            cursorColor: ColorsManager.primary,
            selectionColor: ColorsManager.primary.withValues(alpha: 0.3),
            selectionHandleColor: ColorsManager.primary,
          ),
          child: TextFormField(
            onFieldSubmitted: onFieldSubmitted,
            style: GoogleFonts.tajawal(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: ColorsManager.textPrimary,
            ),
            cursorColor: ColorsManager.primary,
            cursorErrorColor: ColorsManager.warning,
            controller: controller,
            obscureText: isObscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            validator: validator,
            maxLines: maxLines,
            enabled: enabled,
            readOnly: readOnly,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorsManager.cardBg,
              hintText: hintText,
              hintStyle: GoogleFonts.tajawal(
                color: ColorsManager.textSecondary,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
              errorStyle: GoogleFonts.tajawal(
                color: ColorsManager.warning,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 14.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: ColorsManager.borderDark, width: 1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: ColorsManager.borderDark, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(
                  color: ColorsManager.primary,
                  width: 1.5,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: ColorsManager.warning),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
