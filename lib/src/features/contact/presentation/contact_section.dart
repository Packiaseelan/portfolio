import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common_widgets/glass_container.dart';
import '../../../utils/constants.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.section),
      child: GlassContainer(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          children: [
            Text(
              "Let's Build Something",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2, end: 0),
            const SizedBox(height: AppSpacing.md),
            Text(
              "Currently exploring opportunities in AI and native product engineering.",
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 200.ms, duration: 800.ms),
            const SizedBox(height: AppSpacing.xxl),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: AppSpacing.lg,
              runSpacing: AppSpacing.md,
              children: [
                _SocialButton(
                  icon: Icons.code,
                  label: "GitHub",
                  onPressed: () => _launchUrl('https://github.com/Packiaseelan'),
                ),
                _SocialButton(
                  icon: Icons.work,
                  label: "LinkedIn",
                  onPressed: () => _launchUrl('https://www.linkedin.com/in/packiaseelan14/'),
                ),
                _SocialButton(
                  icon: Icons.email,
                  label: "Email",
                  onPressed: () => _launchUrl('mailto:packiaseelan14@gmail.com.com'),
                ),
              ],
            ).animate().fadeIn(delay: 400.ms, duration: 800.ms),
            const SizedBox(height: AppSpacing.xxl),
            const _ResumeButton().animate().fadeIn(delay: 600.ms, duration: 800.ms),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: IconButton(
        icon: Icon(widget.icon),
        onPressed: widget.onPressed,
        tooltip: widget.label,
        iconSize: 32,
        color: _isHovered ? AppColors.accentPrimary : AppColors.textSecondary,
        style: IconButton.styleFrom(
          backgroundColor: _isHovered ? AppColors.accentPrimary.withOpacity(0.1) : Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
      ),
    );
  }
}

class _ResumeButton extends StatefulWidget {
  const _ResumeButton();

  @override
  State<_ResumeButton> createState() => _ResumeButtonState();
}

class _ResumeButtonState extends State<_ResumeButton> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _pressController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  void _downloadResume() {
    final anchor = html.AnchorElement(
      href: 'assets/pdf/Packiaseelan_Resume.pdf',
    )
      ..target = '_blank'
      ..download = 'Packiaseelan_Resume.pdf';

    anchor.click();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => _pressController.forward(),
        onTapUp: (_) {
          _pressController.reverse();
          _downloadResume();
        },
        onTapCancel: () => _pressController.reverse(),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: Matrix4.identity()..translate(0.0, _isHovered ? -4.0 : 0.0),
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppColors.glassBackground.withValues(alpha: _isHovered ? 0.15 : 0.05),
              borderRadius: BorderRadius.circular(AppRadius.xxl),
              border: Border.all(
                color: _isHovered ? AppColors.accentPrimary : AppColors.accentPrimary.withValues(alpha: 0.5),
                width: 2,
              ),
              boxShadow: [
                if (_isHovered)
                  BoxShadow(
                    color: AppColors.accentPrimary.withValues(alpha: 0.4),
                    blurRadius: 30,
                    spreadRadius: 2,
                  ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.download_rounded,
                  color: _isHovered ? Colors.white : AppColors.accentPrimary,
                  size: 24,
                ),
                const SizedBox(width: AppSpacing.md),
                Text(
                  "Download Resume ↓",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _isHovered ? Colors.white : AppColors.textPrimary,
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
