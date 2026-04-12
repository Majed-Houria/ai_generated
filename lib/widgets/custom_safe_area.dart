import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/services.dart';

import '../theming/colors.dart';

class CustomSafeArea extends StatelessWidget {
  final Widget child;
  final bool isBottomInset;
  final bool isTopInset;
  final Color? backgroundColor;

  const CustomSafeArea({
    super.key,
    required this.child,
    this.isBottomInset = true,
    this.isTopInset = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? ColorsManager.surface;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: bgColor,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: false,
      ),
      child: Container(
        color: bgColor,
        child: SafeArea(
          top: isTopInset,
          bottom: Platform.isIOS ? false : isBottomInset,
          child: child,
        ),
      ),
    );
  }
}
