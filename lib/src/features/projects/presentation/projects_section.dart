import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../common_widgets/glass_container.dart';
import '../../../utils/constants.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.section),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Featured Projects",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.1, end: 0),
          const SizedBox(height: AppSpacing.xxl),
          const _ProjectGrid(),
        ],
      ),
    );
  }
}

class _ProjectGrid extends StatelessWidget {
  const _ProjectGrid();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > Breakpoints.tablet;

    final projects = [
      _ProjectData(
        title: "Selfly",
        description: "An AI-powered journaling app that helps you understand yourself better through sentiment analysis and automated insights.",
        techStack: ["SwiftUI", "CoreML", "CloudKit"],
        gradientColors: [AppColors.accentSecondary, AppColors.accentPrimary],
      ),
      _ProjectData(
        title: "SwiftUI Architecture Kit",
        description: "A robust, scalable architecture framework for building complex SwiftUI applications with a focus on testability and modularity.",
        techStack: ["SwiftUI", "Combine", "TDD"],
        gradientColors: [AppColors.accentPrimary, AppColors.accentTertiary],
      ),
      _ProjectData(
        title: "Flutter Theme Manager",
        description: "A dynamic theming engine for Flutter allowing runtime switching of complex design systems and component tokens.",
        techStack: ["Flutter", "Dart", "Provider"],
        gradientColors: [AppColors.accentTertiary, AppColors.accentSecondary],
      ),
      _ProjectData(
        title: "SwiftUI DateTimePicker",
        description: "A highly customizable and fully accessible date and time picker component built entirely in native SwiftUI.",
        techStack: ["Swift", "SwiftUI", "Open Source"],
        gradientColors: [AppColors.accentPrimary, Colors.blue[400]!],
      ),
    ];

    if (isDesktop) {
      return Wrap(
        spacing: AppSpacing.xl,
        runSpacing: AppSpacing.xl,
        children: projects.asMap().entries.map((entry) {
          final index = entry.key;
          final project = entry.value;
          return SizedBox(
            width: (size.width - (AppSpacing.xxl * 2) - AppSpacing.xl) / 2, // half width minus padding/spacing
            child: _ProjectCard(project: project)
                .animate()
                .fadeIn(delay: (200 * index).ms, duration: 600.ms)
                .slideY(begin: 0.1, end: 0),
          );
        }).toList(),
      );
    } else {
      return Column(
        children: projects.asMap().entries.map((entry) {
          final index = entry.key;
          final project = entry.value;
          return Padding(
            padding: EdgeInsets.only(bottom: index == projects.length - 1 ? 0 : AppSpacing.xl),
            child: _ProjectCard(project: project)
                .animate()
                .fadeIn(delay: (200 * index).ms, duration: 600.ms)
                .slideY(begin: 0.1, end: 0),
          );
        }).toList(),
      );
    }
  }
}

class _ProjectData {
  final String title;
  final String description;
  final List<String> techStack;
  final List<Color> gradientColors;

  _ProjectData({
    required this.title,
    required this.description,
    required this.techStack,
    required this.gradientColors,
  });
}

class _ProjectCard extends StatefulWidget {
  final _ProjectData project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -10.0 : 0.0),
        child: GlassContainer(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Stack(
            children: [
              // Animated Background Gradient on Hover
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _isHovered ? 0.15 : 0.05,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: widget.project.gradientColors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.project.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    widget.project.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: widget.project.techStack.map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceHighlight.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(AppRadius.md),
                          border: Border.all(color: AppColors.border.withOpacity(0.5)),
                        ),
                        child: Text(
                          tech,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.accentPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
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
