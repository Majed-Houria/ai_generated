import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'theming/colors.dart';

import 'widgets/custom_safe_area.dart';
import 'widgets/neural_network_painter.dart';
import 'widgets/home_logo.dart';
import 'widgets/hero_section.dart';
import 'widgets/scanner_mockup.dart';
import 'widgets/section_title.dart';
import 'widgets/features_grid.dart';
import 'widgets/how_it_works_section.dart';
import 'widgets/about_section.dart';
import 'widgets/glow_circle.dart';

// =============================================================
// AI Detection Platform - Cyber Teal Theme (Arabic RTL)
// =============================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scanController;
  late AnimationController _floatController;
  late AnimationController _neuralController;
  late AnimationController _lineScanController;

  final ScrollController _scrollController = ScrollController();
  final GlobalKey _featuresKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _neuralController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
    _lineScanController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scanController.dispose();
    _floatController.dispose();
    _neuralController.dispose();
    _lineScanController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToFeatures() {
    final context = _featuresKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
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
                // 1. Neural Network Background Animation
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _neuralController,
                    builder: (context, child) {
                      return CustomPaint(
                        painter: NeuralNetworkPainter(
                          progress: _neuralController.value,
                          color: ColorsManager.primary.withValues(alpha: 0.15),
                        ),
                      );
                    },
                  ),
                ),

                // 3. Glowing Orbs
                AnimatedBuilder(
                  animation: _floatController,
                  builder: (context, child) {
                    final float =
                        math.sin(_floatController.value * math.pi) * 15;
                    return Stack(
                      children: [
                        Positioned(
                          top: 200.h + float,
                          right: -50.w,
                          child: GlowCircle(
                            size: 250.r,
                            color: ColorsManager.highlight.withValues(
                              alpha: 0.12,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 300.h - float,
                          left: -50.w,
                          child: GlowCircle(
                            size: 200.r,
                            color: ColorsManager.primary.withValues(alpha: 0.1),
                          ),
                        ),
                      ],
                    );
                  },
                ),

                // 4. Main Scrollable Content
                SafeArea(
                  child: CustomScrollView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: FadeTransition(
                            opacity: _fadeController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 30.h),
                                // Centered Animated Logo
                                HomeLogo(
                                  floatAnimation: _floatController,
                                  scanAnimation: _scanController,
                                ),
                                SizedBox(height: 30.h),
                                HeroSection(
                                  floatAnimation: _floatController,
                                  onStartScan: _scrollToFeatures,
                                ),
                                SizedBox(height: 30.h),
                                // Live Scanning Mockup UI
                                ScannerMockup(
                                  scanLineAnimation: _lineScanController,
                                ),
                                SizedBox(height: 50.h),
                                SectionTitle(
                                  key: _featuresKey,
                                  title: 'خدمات الفحص المتقدمة',
                                ),
                                FeaturesGrid(),
                                SizedBox(height: 50.h),
                                const SectionTitle(title: 'كيف تعمل المنصة'),
                                HowItWorksSection(
                                  floatAnimation: _floatController,
                                ),
                                SizedBox(height: 50.h),
                                const AboutSection(),
                                SizedBox(height: 40.h),
                              ],
                            ),
                          ),
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