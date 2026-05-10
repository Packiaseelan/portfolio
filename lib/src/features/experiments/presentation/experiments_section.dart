import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../common_widgets/glass_container.dart';
import '../../../utils/constants.dart';

class ExperimentsSection extends StatelessWidget {
  const ExperimentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final experiments = [
      "Apple Maps Bottom Sheet",
      "Server Driven UI",
      "Speech Recognition",
      "AI Agent Orchestration",
      "HealthKit Syncing",
      "Design Systems",
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.section),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Experiments",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.1, end: 0),
          const SizedBox(height: AppSpacing.xxl),
          Wrap(
            spacing: AppSpacing.xl,
            runSpacing: AppSpacing.xl,
            children: experiments.asMap().entries.map((entry) {
              final index = entry.key;
              final name = entry.value;
              return _ExperimentCard(name: name)
                  .animate()
                  .fadeIn(delay: (100 * index).ms, duration: 500.ms)
                  .scaleXY(begin: 0.9, end: 1);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _ExperimentCard extends StatefulWidget {
  final String name;
  const _ExperimentCard({required this.name});

  @override
  State<_ExperimentCard> createState() => _ExperimentCardState();
}

class _ExperimentCardState extends State<_ExperimentCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        child: GlassContainer(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.lg),
          border: Border.all(
            color: _isHovered ? AppColors.accentPrimary : AppColors.border,
            width: _isHovered ? 2 : 1,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.science,
                color: _isHovered ? AppColors.accentPrimary : AppColors.textSecondary,
              ),
              const SizedBox(width: AppSpacing.md),
              Flexible(
                child: Text(
                  widget.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: _isHovered ? AppColors.textPrimary : AppColors.textSecondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
