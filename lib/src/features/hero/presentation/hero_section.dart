import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../common_widgets/animated_gradient_text.dart';
import '../../../common_widgets/floating_panel.dart';
import '../../../common_widgets/glass_container.dart';
import '../../../theme/app_theme.dart';
import '../../../utils/constants.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > Breakpoints.tablet;

    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
          child: Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // LEFT SIDE - Typography and CTAs
              Expanded(
                flex: isDesktop ? 5 : 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                  children: [
                    if (!isDesktop) const SizedBox(height: AppSpacing.xxxl * 2),
                    // Availability Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: AppColors.accentTertiary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(AppRadius.xxl),
                        border: Border.all(color: AppColors.accentTertiary.withValues(alpha: 0.5)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.accentTertiary,
                              shape: BoxShape.circle,
                            ),
                          ).animate(onPlay: (controller) => controller.repeat(reverse: true))
                           .fade(duration: 1.seconds),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            "Available for exciting opportunities",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.accentTertiary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2, end: 0),
                    
                    const SizedBox(height: AppSpacing.xl),
                    
                    // Main Headline
                    Text(
                      "Hi, I am",
                      style: TextStyle(
                        fontSize: isDesktop ? 64 : 40,
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                        letterSpacing: isDesktop ? -2 : -1,
                        color: Colors.white,
                      ),
                    ).animate().fadeIn(delay: 200.ms, duration: 800.ms).slideY(begin: 0.2, end: 0),
                    
                    AnimatedGradientText(
                      text: "Packiaseelan",
                      style: TextStyle(
                        fontSize: isDesktop ? 64 : 40,
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                        letterSpacing: isDesktop ? -2 : -1,
                      ),
                      colors: const [
                        AppColors.accentPrimary,
                        AppColors.accentSecondary,
                      ],
                    ).animate().fadeIn(delay: 400.ms, duration: 800.ms).slideY(begin: 0.2, end: 0),
                    
                    Text(
                      "Building intelligent\nnative experiences.",
                      style: TextStyle(
                        fontSize: isDesktop ? 64 : 40,
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                        letterSpacing: isDesktop ? -2 : -1,
                        color: Colors.white,
                      ),
                      textAlign: isDesktop ? TextAlign.left : TextAlign.center,
                    ).animate().fadeIn(delay: 600.ms, duration: 800.ms).slideY(begin: 0.2, end: 0),

                    const SizedBox(height: AppSpacing.lg),
                    
                    // Description
                    Text(
                      "I design and build high-performance iOS & Flutter applications with a strong focus on architecture, user experience, and AI-powered developer tools.",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      textAlign: isDesktop ? TextAlign.left : TextAlign.center,
                    ).animate().fadeIn(delay: 800.ms, duration: 800.ms).slideY(begin: 0.2, end: 0),

                    const SizedBox(height: AppSpacing.xxl),
                    
                    // Buttons
                    Wrap(
                      alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
                      spacing: AppSpacing.md,
                      runSpacing: AppSpacing.md,
                      children: [
                        _PrimaryButton(text: "View My Work", onPressed: () {}),
                        _SecondaryButton(text: "Explore AI Lab", onPressed: () {}),
                      ],
                    ).animate().fadeIn(delay: 1000.ms, duration: 800.ms).slideY(begin: 0.2, end: 0),

                    const SizedBox(height: AppSpacing.xxl),

                    // Tech Stack Pills
                    Wrap(
                      alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.sm,
                      children: [
                        _TechPill("Swift"),
                        _TechPill("Flutter"),
                        _TechPill("Firebase"),
                        _TechPill("AI"),
                        _TechPill("OpenAI"),
                        _TechPill("Architecture"),
                      ],
                    ).animate().fadeIn(delay: 1200.ms, duration: 800.ms).slideY(begin: 0.2, end: 0),
                  ],
                ),
              ),
              
              if (isDesktop) const SizedBox(width: AppSpacing.xxxl),
              
              // RIGHT SIDE - Complex Visual Composition
              if (isDesktop)
                Expanded(
                  flex: 6,
                  child: SizedBox(
                    height: 600,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        // Blurred Engineering Dashboard (Back Layer)
                        Positioned(
                          right: -40,
                          top: 0,
                          child: FloatingPanel(
                            width: 350,
                            height: 250,
                            initialOffset: const Offset(0, 0),
                            child: _DashboardMockup(),
                          ).animate().fadeIn(delay: 800.ms, duration: 1.seconds),
                        ),
                        
                        // Code Editor Window (Middle Layer)
                        Positioned(
                          left: -50,
                          bottom: 50,
                          child: FloatingPanel(
                            width: 380,
                            height: 280,
                            initialOffset: const Offset(0, 20),
                            child: _SwiftUICodeMockup(),
                          ).animate().fadeIn(delay: 1000.ms, duration: 1.seconds),
                        ),

                        // iPhone Mockup (Front Layer)
                        Positioned(
                          right: 80,
                          bottom: -20,
                          child: const _IPhoneMockup()
                              .animate(onPlay: (controller) => controller.repeat(reverse: true))
                              .moveY(begin: -10, end: 10, duration: 4.seconds, curve: Curves.easeInOut)
                              .fadeIn(delay: 1200.ms, duration: 1.seconds),
                        ),

                        // Floating Glass Card
                        Positioned(
                          left: -20,
                          top: 80,
                          child: const _FloatingMessageCard()
                              .animate(onPlay: (controller) => controller.repeat(reverse: true))
                              .moveY(begin: 5, end: -5, duration: 3.seconds, curve: Curves.easeInOut)
                              .fadeIn(delay: 1400.ms, duration: 1.seconds),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _PrimaryButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentPrimary.withValues(alpha: 0.4),
            blurRadius: 20,
            spreadRadius: -5,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentPrimary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.lg),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.xxl),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _SecondaryButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        side: const BorderSide(color: AppColors.border, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.lg),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.xxl),
        ),
        backgroundColor: AppColors.glassBackground.withValues(alpha: 0.05),
      ),
      child: Text(text),
    );
  }
}

class _TechPill extends StatelessWidget {
  final String label;
  const _TechPill(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surfaceHighlight.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SwiftUICodeMockup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _Circle(color: Colors.red[400]!),
            const SizedBox(width: 8),
            _Circle(color: Colors.yellow[400]!),
            const SizedBox(width: 8),
            _Circle(color: Colors.green[400]!),
            const SizedBox(width: AppSpacing.md),
            Text("ContentView.swift", style: codeTextStyle.copyWith(color: AppColors.textSecondary, fontSize: 12)),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        Text("struct ContentView: View {", style: codeTextStyle.copyWith(color: AppColors.accentSecondary)),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("var body: some View {", style: codeTextStyle),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ZStack {", style: codeTextStyle),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text("CinematicBackground()", style: codeTextStyle.copyWith(color: AppColors.accentPrimary)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text("IntelligentInterface()", style: codeTextStyle.copyWith(color: AppColors.accentTertiary)),
                    ),
                    Text("}", style: codeTextStyle),
                  ],
                ),
              ),
              Text("}", style: codeTextStyle),
            ],
          ),
        ),
        Text("}", style: codeTextStyle.copyWith(color: AppColors.accentSecondary)),
      ],
    );
  }
}

class _DashboardMockup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 100, height: 20, color: AppColors.border),
              Container(width: 40, height: 40, decoration: const BoxDecoration(color: AppColors.border, shape: BoxShape.circle)),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Container(decoration: BoxDecoration(color: AppColors.accentPrimary.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(AppRadius.sm)))),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(child: Container(decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(AppRadius.sm)))),
                      const SizedBox(height: AppSpacing.md),
                      Expanded(child: Container(decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(AppRadius.sm)))),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _FloatingMessageCard extends StatelessWidget {
  const _FloatingMessageCard();

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
      borderRadius: BorderRadius.circular(AppRadius.xl),
      border: Border.all(color: AppColors.accentSecondary.withValues(alpha: 0.5), width: 1),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.auto_awesome, color: AppColors.accentSecondary, size: 24),
          const SizedBox(width: AppSpacing.sm),
          Text(
            "Crafting clean, scalable &\ndelightful digital experiences.",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _IPhoneMockup extends StatelessWidget {
  const _IPhoneMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 480,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: AppColors.border, width: 8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 30,
            spreadRadius: 5,
          ),
          BoxShadow(
            color: AppColors.accentPrimary.withValues(alpha: 0.2),
            blurRadius: 50,
            spreadRadius: -10,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Screen Content (Productivity App Mock)
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.xxl), // Notch space
                Text("Today", style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: AppSpacing.lg),
                _MockAppCard(color: AppColors.accentPrimary),
                const SizedBox(height: AppSpacing.md),
                _MockAppCard(color: AppColors.accentSecondary),
                const SizedBox(height: AppSpacing.md),
                _MockAppCard(color: AppColors.accentTertiary),
              ],
            ),
          ),
          // Dynamic Island / Notch
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: 80,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          // Glass overlay for reflection
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: 0.1),
                  Colors.transparent,
                  Colors.transparent,
                ],
                stops: const [0.0, 0.3, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MockAppCard extends StatelessWidget {
  final Color color;
  const _MockAppCard({required this.color});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Row(
        children: [
          Container(width: 40, height: 40, decoration: BoxDecoration(color: color.withValues(alpha: 0.5), shape: BoxShape.circle)),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 10, width: double.infinity, color: color.withValues(alpha: 0.5)),
                const SizedBox(height: 8),
                Container(height: 10, width: 80, color: color.withValues(alpha: 0.3)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  final Color color;
  const _Circle({required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle));
  }
}
