import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../common_widgets/glass_container.dart';
import '../../../utils/constants.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.section),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Skills & Expertise",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.1, end: 0),
          const SizedBox(height: AppSpacing.xxl),
          const _SkillsGrid(),
        ],
      ),
    );
  }
}

class _SkillsGrid extends StatelessWidget {
  const _SkillsGrid();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > Breakpoints.tablet;

    final skills = [
      _SkillData(
        title: "iOS & Flutter Expert",
        description: "Deep expertise in native iOS (Swift, SwiftUI) and cross-platform Flutter development, ensuring high-performance, pixel-perfect applications.",
        icon: Icons.apple,
        color: AppColors.accentPrimary,
      ),
      _SkillData(
        title: "Modular Architect",
        description: "Designing scalable, maintainable systems using Clean Architecture, modularization, and advanced state management patterns.",
        icon: Icons.architecture,
        color: AppColors.accentSecondary,
      ),
      _SkillData(
        title: "UI/UX Craftsmanship",
        description: "Bridging the gap between design and engineering with custom animations, glassmorphism, and responsive layouts.",
        icon: Icons.design_services,
        color: AppColors.accentTertiary,
      ),
      _SkillData(
        title: "AI & Developer Tools",
        description: "Building intelligent workflows, CLI tools, and integrating LLMs to supercharge developer productivity and product features.",
        icon: Icons.memory,
        color: Colors.blue[400]!,
      ),
    ];

    if (isDesktop) {
      return Wrap(
        spacing: AppSpacing.xl,
        runSpacing: AppSpacing.xl,
        children: skills.asMap().entries.map((entry) {
          final index = entry.key;
          final skill = entry.value;
          return SizedBox(
            width: (size.width - (AppSpacing.xxl * 2) - AppSpacing.xl) / 2,
            child: _SkillCard(skill: skill)
                .animate()
                .fadeIn(delay: (200 * index).ms, duration: 600.ms)
                .slideY(begin: 0.1, end: 0),
          );
        }).toList(),
      );
    } else {
      return Column(
        children: skills.asMap().entries.map((entry) {
          final index = entry.key;
          final skill = entry.value;
          return Padding(
            padding: EdgeInsets.only(bottom: index == skills.length - 1 ? 0 : AppSpacing.xl),
            child: _SkillCard(skill: skill)
                .animate()
                .fadeIn(delay: (200 * index).ms, duration: 600.ms)
                .slideY(begin: 0.1, end: 0),
          );
        }).toList(),
      );
    }
  }
}

class _SkillData {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  _SkillData({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class _SkillCard extends StatefulWidget {
  final _SkillData skill;
  const _SkillCard({required this.skill});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -5.0 : 0.0),
        child: GlassContainer(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Stack(
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _isHovered ? 0.1 : 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [widget.skill.color, Colors.transparent],
                      center: Alignment.topRight,
                      radius: 1.5,
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: widget.skill.color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppRadius.lg),
                      border: Border.all(color: widget.skill.color.withValues(alpha: 0.3)),
                    ),
                    child: Icon(
                      widget.skill.icon,
                      color: widget.skill.color,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.lg),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.skill.title,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          widget.skill.description,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
