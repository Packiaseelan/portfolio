import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/constants.dart';

class GlassNavbar extends StatelessWidget {
  final PageController? pageController;

  const GlassNavbar({super.key, this.pageController});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > Breakpoints.tablet;

    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(color: AppColors.glassBorder.withValues(alpha: 0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 20,
            spreadRadius: -5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            color: AppColors.glassBackground.withValues(alpha: 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // LEFT SIDE
                _NavbarLogo(),

                // CENTER NAVIGATION
                if (isDesktop) _NavbarLinks(pageController: pageController),

                // RIGHT SIDE
                _NavbarCTA(),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2, end: 0);
  }
}

class _NavbarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.accentPrimary.withValues(alpha: 0.2),
            border: Border.all(color: AppColors.accentPrimary),
            boxShadow: [
              BoxShadow(
                color: AppColors.accentPrimary.withValues(alpha: 0.5),
                blurRadius: 10,
              ),
            ],
          ),
          child: Center(
            child: Text(
              "PS",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        if (MediaQuery.of(context).size.width > Breakpoints.mobile)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Packiaseelan Socretes",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  height: 1.2,
                ),
              ),
              Text(
                "iOS Engineer & AI Product Builder",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.2,
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class _NavbarLinks extends StatelessWidget {
  final PageController? pageController;

  const _NavbarLinks({this.pageController});

  @override
  Widget build(BuildContext context) {
    final links = [
      "Home",
      "Projects",
      // "AI Playground",
      "Experience",
      "Skills",
      "Blog",
      "Contact"
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: links.asMap().entries.map((entry) {
        final index = entry.key;
        final link = entry.value;
        return _NavbarLinkItem(
          title: link,
          onTap: () {
            if (link != "Blog" && pageController != null) {
              // Scroll to the corresponding page (assuming 1-to-1 mapping)
              // Note: Blog might navigate away or show coming soon.
              pageController!.animateToPage(
                index,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
              );
            }
          },
        );
      }).toList(),
    );
  }
}

class _NavbarLinkItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavbarLinkItem({required this.title, required this.onTap});

  @override
  State<_NavbarLinkItem> createState() => _NavbarLinkItemState();
}

class _NavbarLinkItemState extends State<_NavbarLinkItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: _isHovered ? AppColors.textPrimary : AppColors.textSecondary,
              fontWeight: _isHovered ? FontWeight.bold : FontWeight.w500,
            ),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}

class _NavbarCTA extends StatefulWidget {
  @override
  State<_NavbarCTA> createState() => _NavbarCTAState();
}

class _NavbarCTAState extends State<_NavbarCTA> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {}, // Trigger contact action
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.accentPrimary : AppColors.accentPrimary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppRadius.xl),
            border: Border.all(color: AppColors.accentPrimary),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: AppColors.accentPrimary.withValues(alpha: 0.5),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
            ],
          ),
          child: Text(
            "Let's Connect ✨",
            style: TextStyle(
              color: _isHovered ? Colors.white : AppColors.accentPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
