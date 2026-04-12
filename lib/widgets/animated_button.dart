import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theming/colors.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback onTap;
  final Color themeColor;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.isPrimary,
    required this.onTap,
    required this.themeColor,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.0,
      upperBound: 0.05,
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bgStart = ColorsManager.bgStart;

    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
        _animController.forward();
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        _animController.reverse();
        widget.onTap();
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
        _animController.reverse();
      },
      child: AnimatedBuilder(
        animation: _animController,
        builder: (context, child) {
          return Transform.scale(
            scale: 1.0 - _animController.value,
            child: child,
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_isPressed
                    ? widget.themeColor.withValues(alpha: 0.8)
                    : widget.themeColor)
                : (_isPressed
                    ? ColorsManager.borderDark.withValues(alpha: 0.5)
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: widget.isPrimary
                  ? widget.themeColor
                  : ColorsManager.borderDark,
              width: 1.5,
            ),
            boxShadow: widget.isPrimary
                ? [
                    BoxShadow(
                      color: widget.themeColor.withValues(
                        alpha: _isPressed ? 0.6 : 0.3,
                      ),
                      blurRadius: _isPressed ? 30 : 20,
                      spreadRadius: _isPressed ? 2 : -5,
                    ),
                  ]
                : [],
          ),
          child: Text(
            widget.text,
            style: GoogleFonts.tajawal(
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
              color: widget.isPrimary ? bgStart : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
