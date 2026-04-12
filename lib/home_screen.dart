import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'dart:math' as math;

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

  // --- CYBER TEAL THEME COLORS ---
  static const _bgStart = Color(0xFF0F1C2E); // Background Deep Blue
  static const _bgEnd = Color(0xFF09121F);   // Background Darker Gradient
  static const _primary = Color(0xFF14B8A6); // Teal Primary
  static const _accent = Color(0xFF22D3EE);  // Neon Cyan Accent
  static const _highlight = Color(0xFF6366F1); // Indigo Highlight
  static const _success = Color(0xFF10B981); // Emerald Success
  static const _warning = Color(0xFFEF4444); // Warning / AI Red
  static const _textPrimary = Color(0xFFF8FAFC); // White/Slate
  static const _textSecondary = Color(0xFF94A3B8); // Dimmed Slate
  static const _cardBg = Color(0xFF162539);  // Foreground container
  static const _borderDark = Color(0xFF1E334D);

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _scanController = AnimationController(
        vsync: this, duration: const Duration(seconds: 4))
      ..repeat();
    _floatController = AnimationController(
        vsync: this, duration: const Duration(seconds: 3))
      ..repeat(reverse: true);
    _neuralController = AnimationController(
        vsync: this, duration: const Duration(seconds: 20))
      ..repeat();
    _lineScanController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500))
      ..repeat(reverse: true);

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scanController.dispose();
    _floatController.dispose();
    _neuralController.dispose();
    _lineScanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_bgStart, _bgEnd],
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
                      painter: _NeuralNetworkPainter(
                        progress: _neuralController.value,
                        color: _primary.withValues(alpha: 0.15),
                      ),
                    );
                  },
                ),
              ),

              // 3. Glowing Orbs
              AnimatedBuilder(
                animation: _floatController,
                builder: (context, child) {
                  final float = math.sin(_floatController.value * math.pi) * 15;
                  return Stack(
                    children: [
                      Positioned(
                        top: 200.h + float,
                        right: -50.w,
                        child: _glowCircle(250.r, _highlight.withValues(alpha: 0.12)),
                      ),
                      Positioned(
                        bottom: 300.h - float,
                        left: -50.w,
                        child: _glowCircle(200.r, _primary.withValues(alpha: 0.1)),
                      ),
                    ],
                  );
                },
              ),

              // 4. Main Scrollable Content
              SafeArea(
                child: CustomScrollView(
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
                              _buildAnimatedCenteredLogo(),
                              SizedBox(height: 30.h),
                              _buildHeroSection(),
                              SizedBox(height: 30.h),
                              // Live Scanning Mockup UI
                              _buildScannerMockup(),
                              SizedBox(height: 50.h),
                              _buildSectionTitle('خدمات الفحص المتقدمة'),
                              _buildFeaturesGrid(),
                              SizedBox(height: 50.h),
                              _buildSectionTitle('كيف تعمل المنصة'),
                              _buildHowItWorks(),
                              SizedBox(height: 50.h),
                              _buildAboutSection(),
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
    );
  }

  Widget _glowCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: color, blurRadius: 90, spreadRadius: 30),
        ],
      ),
    );
  }

  // Centered Animated Logo at the top
  Widget _buildAnimatedCenteredLogo() {
    return AnimatedBuilder(
      animation: _floatController,
      builder: (context, child) {
        final floatY = math.sin(_floatController.value * math.pi) * 8;
        return Transform.translate(
          offset: Offset(0, floatY),
          child: Column(
            children: [
              Container(
                width: 70.r,
                height: 70.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _cardBg,
                  border: Border.all(color: _primary.withValues(alpha: 0.4), width: 1.5),
                  boxShadow: [
                    BoxShadow(color: _primary.withValues(alpha: 0.3), blurRadius: 20, spreadRadius: -2)
                  ],
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      RotationTransition(
                        turns: _scanController,
                        child: Icon(LucideIcons.loader, color: _highlight.withValues(alpha: 0.3), size: 45.r),
                      ),
                      Icon(LucideIcons.scanFace, color: _primary, size: 30.r),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'VerifyAI\nدرع الذكاء الاصطناعي',
                textAlign: TextAlign.center,
                style: GoogleFonts.tajawal(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  height: 1.3,
                  color: _textPrimary,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: _primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: _primary.withValues(alpha: 0.3)),
            boxShadow: [
              BoxShadow(color: _primary.withValues(alpha: 0.15), blurRadius: 15)
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                animation: _floatController,
                builder: (context, child) {
                  return Container(
                    width: 8.r,
                    height: 8.r,
                    decoration: BoxDecoration(
                      color: _primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: _primary,
                            blurRadius: 8 + (math.sin(_floatController.value * math.pi) * 4))
                      ],
                    ),
                  );
                },
              ),
              SizedBox(width: 10.w),
              Text(
                'الشبكة العصبونية جاهزة للتحليل',
                style: GoogleFonts.tajawal(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: _primary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          'اكتشف المحتوى المُولّد\nبالذكاء الاصطناعي فوراً',
          textAlign: TextAlign.center,
          style: GoogleFonts.tajawal(
            fontSize: 28.sp,
            fontWeight: FontWeight.w900,
            height: 1.3,
            color: _textPrimary,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'منصة قوية وموثوقة للتحقق من مصداقية المحتوى الرقمي. اكتشف الصور الوهمية، الفيديوهات المزيفة (Deepfake)، الأصوات المقلدة، والنصوص المسيئة باستخدام أحدث خوارزميات التعلم العميق.',
          textAlign: TextAlign.center,
          style: GoogleFonts.tajawal(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: _textSecondary,
            height: 1.6,
          ),
        ),
        SizedBox(height: 32.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _AnimatedButton(
              text: 'ابدأ الفحص',
              isPrimary: true,
              themeColor: _primary,
              onTap: () {
                _showAILoadingDialog();
              },
            ),
            SizedBox(width: 16.w),
            _AnimatedButton(
              text: 'اعرف المزيد',
              isPrimary: false,
              themeColor: _accent,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  // Scanning Mockup over uploaded media design
  Widget _buildScannerMockup() {
    return Container(
      width: double.infinity,
      height: 140.h,
      decoration: BoxDecoration(
        color: _cardBg.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: _highlight.withValues(alpha: 0.3)),
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(LucideIcons.image, size: 60.r, color: _borderDark),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LucideIcons.fileText, size: 50.r, color: _borderDark),
                SizedBox(width: 40.w),
                Icon(LucideIcons.mic, size: 50.r, color: _borderDark),
              ],
            ),
          ),

          // Moving Scanning Line
          AnimatedBuilder(
            animation: _lineScanController,
            builder: (context, child) {
              final position = _lineScanController.value * 140.h;
              return Positioned(
                top: position,
                left: 0,
                right: 0,
                child: Container(
                  height: 3.h,
                  decoration: BoxDecoration(
                    color: _accent,
                    boxShadow: [
                      BoxShadow(color: _accent, blurRadius: 15, spreadRadius: 2),
                      BoxShadow(color: _textPrimary, blurRadius: 5),
                    ],
                  ),
                ),
              );
            },
          ),

          // Overlay gradient for depth
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    _bgStart.withValues(alpha: 0.1),
                    _bgStart.withValues(alpha: 0.6),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.tajawal(
            fontSize: 22.sp,
            fontWeight: FontWeight.w800,
            color: _textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: 50.w,
          height: 3.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.r),
            gradient: const LinearGradient(
              colors: [_primary, _highlight],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturesGrid() {
    final features = [
      {
        'title': 'فحص الصور',
        'desc': 'اكتشف هل الصورة مُولدة بنماذج الذكاء الاصطناعي بدقة عالية.',
        'icon': LucideIcons.scan,
        'color': _primary,
      },
      {
        'title': 'تحليل الفيديو والتزييف',
        'desc': 'حلّل إطارات الفيديو لكشف التزييف العميق (Deepfake) بشكل فوري.',
        'icon': LucideIcons.video,
        'color': _warning,
      },
      {
        'title': 'فحص الأصوات',
        'desc': 'اكتشف الأصوات المُستنسخة والمقلدة بدقة تفوق الأذن البشرية.',
        'icon': LucideIcons.mic,
        'color': _highlight,
      },
      {
        'title': 'التأكد من النصوص',
        'desc': 'تعرّف على النصوص المسيئة أو المولدّة عبر ChatGPT للتحايل.',
        'icon': LucideIcons.messageSquare,
        'color': _accent,
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        children: features
            .map((f) => Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: _FeatureCard(
                    title: f['title'] as String,
                    description: f['desc'] as String,
                    icon: f['icon'] as IconData,
                    color: f['color'] as Color,
                    onTap: () => _showAILoadingDialog(),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildHowItWorks() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStep(LucideIcons.uploadCloud, 'الرفع', 'الملف أو النص', _primary),
          _buildStepLine(),
          _buildStep(LucideIcons.cpu, 'التحليل', 'معالجة ذكية', _highlight),
          _buildStepLine(),
          _buildStep(LucideIcons.shieldCheck, 'النتائج', 'تقارير الموثوقية', _success),
        ],
      ),
    );
  }

  Widget _buildStepLine() {
    return Expanded(
      child: Container(
        height: 2.h,
        margin: EdgeInsets.only(top: 24.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [_borderDark, _accent.withValues(alpha: 0.5)],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(IconData icon, String title, String sub, Color glowColor) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Container(
            width: 54.r,
            height: 54.r,
            decoration: BoxDecoration(
              color: _cardBg,
              shape: BoxShape.circle,
              border: Border.all(color: _borderDark),
              boxShadow: [
                BoxShadow(color: glowColor.withValues(alpha: 0.15), blurRadius: 10, spreadRadius: 2),
              ],
            ),
            child: AnimatedBuilder(
              animation: _floatController,
              builder: (context, child) {
                return Icon(icon, color: glowColor, size: 24.r + (math.sin(_floatController.value * math.pi) * 2));
              },
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
              fontSize: 13.sp,
              fontWeight: FontWeight.w800,
              color: _textPrimary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            sub,
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: _textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: _cardBg.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: _borderDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.info, color: _highlight, size: 24.r),
              SizedBox(width: 10.w),
              Text(
                'عن المنصة',
                style: GoogleFonts.tajawal(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: _textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            'نحارب الاحتيال الرقمي من خلال توفير تقنيات متطورة للصحفيين والمستخدمين للتبين من المحتوى المصطنع. خوارزمياتنا معتمدة ومدربة لتوفير أعلى نسبة دقة في الفحص.',
            style: GoogleFonts.tajawal(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: _textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  // Triggered when clicking an action, reveals AI loading popup
  void _showAILoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(30.r),
            decoration: BoxDecoration(
              color: _cardBg.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: _primary.withValues(alpha: 0.5), width: 1.5),
              boxShadow: [
                BoxShadow(color: _primary.withValues(alpha: 0.2), blurRadius: 40, spreadRadius: 5)
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Custom Scanner Loader
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 80.r,
                      height: 80.r,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(_accent),
                        strokeWidth: 3,
                      ),
                    ),
                    Icon(LucideIcons.cpu, color: _highlight, size: 30.r),
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  'جاري التهيئة والتحليل...',
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: _textPrimary,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'يتم الآن فحص البصمة الرقمية عبر الخوارزميات',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.tajawal(
                    fontSize: 12.sp,
                    color: _textSecondary,
                  ),
                ),
                SizedBox(height: 24.h),
                _AnimatedButton(
                  text: 'إلغاء',
                  isPrimary: false,
                  themeColor: _warning,
                  onTap: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// Animated Button with Hover/Press Glow
// ═══════════════════════════════════════════════════════════════
class _AnimatedButton extends StatefulWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback onTap;
  final Color themeColor;

  const _AnimatedButton({
    required this.text,
    required this.isPrimary,
    required this.onTap,
    required this.themeColor,
  });

  @override
  State<_AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<_AnimatedButton> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150), lowerBound: 0.0, upperBound: 0.05);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bgStart = Color(0xFF0F1C2E);

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
                ? (_isPressed ? widget.themeColor.withValues(alpha: 0.8) : widget.themeColor)
                : (_isPressed ? const Color(0xFF1E334D).withValues(alpha: 0.5) : Colors.transparent),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: widget.isPrimary ? widget.themeColor : const Color(0xFF1E334D),
              width: 1.5,
            ),
            boxShadow: widget.isPrimary
                ? [
                    BoxShadow(
                        color: widget.themeColor.withValues(alpha: _isPressed ? 0.6 : 0.3),
                        blurRadius: _isPressed ? 30 : 20,
                        spreadRadius: _isPressed ? 2 : -5)
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

// ═══════════════════════════════════════════════════════════════
// Interactive Service Card with Hover Glow
// ═══════════════════════════════════════════════════════════════
class _FeatureCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
        lowerBound: 0.0,
        upperBound: 0.03);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isHovered = true);
        _animController.forward();
      },
      onTapUp: (_) {
        setState(() => _isHovered = false);
        _animController.reverse();
        widget.onTap();
      },
      onTapCancel: () {
        setState(() => _isHovered = false);
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
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: const Color(0xFF162539),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: _isHovered
                  ? widget.color.withValues(alpha: 0.5)
                  : const Color(0xFF1E334D),
              width: 1.5,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                        color: widget.color.withValues(alpha: 0.2),
                        blurRadius: 30,
                        spreadRadius: -2)
                  ]
                : [],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: widget.color.withValues(alpha: _isHovered ? 0.2 : 0.1),
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: widget.color.withValues(alpha: 0.2),
                  ),
                ),
                child: Icon(widget.icon, color: widget.color, size: 26.r),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      widget.description,
                      style: GoogleFonts.tajawal(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF94A3B8),
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// Custom Painters (Neural Net & Radar)
// ═══════════════════════════════════════════════════════════════
class _NeuralNetworkPainter extends CustomPainter {
  final double progress;
  final Color color;

  _NeuralNetworkPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    // Generate a fixed number of pseudo-random nodes that shift slowly
    final paintLine = Paint()
      ..color = color.withValues(alpha: 0.5)
      ..strokeWidth = 1.0;

    final paintNode = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const nodeCount = 30;
    final List<Offset> nodes = [];

    // Create drifting nodes
    for (int i = 0; i < nodeCount; i++) {
        // pseudo random deterministic patterns
        final double rx = (math.sin(i * 1.5 + progress * math.pi * 2) * 0.5 + 0.5) * size.width;
        final double ry = (math.cos(i * 2.1 - progress * math.pi * 2) * 0.5 + 0.5) * size.height;
        nodes.add(Offset(rx, ry));
    }

    // Connect nodes if close to each other
    for (int i = 0; i < nodes.length; i++) {
      for (int j = i + 1; j < nodes.length; j++) {
        final double dist = (nodes[i] - nodes[j]).distance;
        if (dist < 120.0) {
          // fades out on distance
          paintLine.color = color.withValues(alpha: (1.0 - dist / 120.0) * 0.6);
          canvas.drawLine(nodes[i], nodes[j], paintLine);
        }
      }
      // draw node
      canvas.drawCircle(nodes[i], 2.5, paintNode);
    }
  }

  @override
  bool shouldRepaint(covariant _NeuralNetworkPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}