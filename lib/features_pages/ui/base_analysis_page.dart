import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theming/colors.dart';
import '../../widgets/neural_network_painter.dart';
import '../../widgets/custom_safe_area.dart';

class BaseAnalysisPage extends StatefulWidget {
  final String title;
  final IconData icon;
  final Widget content;
  final Color themeColor;

  const BaseAnalysisPage({
    super.key,
    required this.title,
    required this.icon,
    required this.content,
    this.themeColor = ColorsManager.primary,
  });

  @override
  State<BaseAnalysisPage> createState() => _BaseAnalysisPageState();
}

class _BaseAnalysisPageState extends State<BaseAnalysisPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _neuralController;

  @override
  void initState() {
    super.initState();
    _neuralController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _neuralController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                LucideIcons.chevronRight,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            titleSpacing: 0,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.icon, color: widget.themeColor, size: 24.r),
                SizedBox(width: 12.w),
                Text(
                  widget.title,
                  style: GoogleFonts.tajawal(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ColorsManager.bgStart, ColorsManager.bgEnd],
              ),
            ),
            child: Stack(
              children: [
                // Background Animation
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _neuralController,
                    builder: (context, child) {
                      return CustomPaint(
                        painter: NeuralNetworkPainter(
                          progress: _neuralController.value,
                          color: widget.themeColor.withValues(alpha: 0.1),
                        ),
                      );
                    },
                  ),
                ),

                // Main Content
                SafeArea(
                  child: Column(
                    children: [
                      // Page Body
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: widget.content,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
