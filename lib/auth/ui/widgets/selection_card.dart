import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SelectionCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const SelectionCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  State<SelectionCard> createState() => SelectionCardState();
}

class SelectionCardState extends State<SelectionCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: GestureDetector(
        onTapDown: (_) => _controller.forward(),
        onTapUp: (_) => _controller.reverse(),
        onTapCancel: () => _controller.reverse(),
        onTap: widget.onTap,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: _isHovered ? widget.color : Colors.transparent,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: widget.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Icon(widget.icon, size: 32.sp, color: widget.color),
                ),
                SizedBox(width: 24.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.tajawal(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1c2f68),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        widget.description,
                        style: GoogleFonts.tajawal(
                          fontSize: 14.sp,
                          color: const Color(0xFF1c2f68).withValues(alpha: 0.6),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  LucideIcons.chevronLeft, // RTL arrow
                  color: widget.color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
