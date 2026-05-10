import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../utils/constants.dart';

class TimelineSection extends StatelessWidget {
  const TimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    final experiences = [
      _TimelineEvent(
        year: "JULY 2021 — PRESENT",
        role: "Senior Associate — Mobile Engineering",
        company: "Publicis Sapient",
        description: "Building AI-native fintech and healthcare experiences across iOS and Flutter platforms for enterprise-scale products.\n\n• Engineered biometric and multi-factor authentication systems for Wio Business, reducing authentication failures by 40% across 50K+ business users.\n• Architected scalable fintech modules including Invoice Systems, Savings Spaces, and reusable Loan Journey frameworks using MVVM and Clean Architecture.\n• Spearheaded Server-Driven UI adoption across Flutter applications, enabling dynamic UI updates without requiring App Store releases.\n• Integrated Stripe payment infrastructure for secure, high-volume merchant transactions and onboarding flows.\n• Delivered HealthKit-powered wellness tracking experiences for Bupa Blua with real-time health synchronization and personalized insights.\n• Built reusable mobile component libraries and internal frameworks that accelerated feature delivery by 25% across teams.\n• Contributed to internal engineering platforms including Flutter Express and RapidX, reducing scaffolding and setup time by nearly 40%.\n\nTech Stack: SwiftUI • UIKit • Flutter • MVVM • Clean Architecture • SDUI • Stripe • HealthKit • GraphQL • REST APIs",
      ),
      _TimelineEvent(
        year: "AUGUST 2016 — JULY 2021",
        role: "Software Engineer — Mobile Development",
        company: "DSRC",
        description: "Led end-to-end mobile application development for enterprise fleet management and connected workforce platforms.\n\n• Owned complete iOS and Android application lifecycle from architecture and development to App Store and Play Store releases.\n• Collaborated closely with backend teams to design robust REST API integrations, reducing API-related crash rates by 35%.\n• Improved production stability and maintained 99%+ crash-free sessions through proactive debugging and performance optimization.\n• Optimized rendering and networking performance for real-time fleet tracking systems supporting 500+ active vehicles.\n• Transitioned large-scale applications from MVC toward modular MVVM-based architecture patterns for improved scalability and maintainability.\n\nTech Stack: Swift • UIKit • Flutter • REST APIs • MVVM • CI/CD • Firebase • Mobile Performance Optimization",
      ),
      _TimelineEvent(
        year: "PERSONAL PRODUCT",
        role: "Mobile Developer & Product Engineer",
        company: "Selfly — AI Habit & Focus Platform",
        description: "Designing and building an AI-powered iOS productivity platform focused on habit formation, focus management, and personal insights.\n\n• Built using SwiftUI with modular architecture and scalable component systems.\n• Integrated HealthKit for activity synchronization and real-time wellness tracking.\n• Developing AI-powered productivity insights, focus recommendations, and behavioral analysis systems.\n• Designing modern focus experiences including Pomodoro sessions, streak tracking, and intelligent habit systems.\n• Architecting the application with production-grade scalability, reusable UI systems, and clean engineering practices.\n\nTech Stack: SwiftUI • HealthKit • AI Integrations • Modular Architecture • Analytics • Focus Systems",
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.section),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Experience",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.1, end: 0),
          const SizedBox(height: AppSpacing.xxl),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              return _TimelineItem(
                event: experiences[index],
                isLast: index == experiences.length - 1,
              ).animate().fadeIn(delay: (200 * index).ms, duration: 600.ms).slideY(begin: 0.1, end: 0);
            },
          ),
        ],
      ),
    );
  }
}

class _TimelineEvent {
  final String year;
  final String role;
  final String company;
  final String description;

  _TimelineEvent({
    required this.year,
    required this.role,
    required this.company,
    required this.description,
  });
}

class _TimelineItem extends StatelessWidget {
  final _TimelineEvent event;
  final bool isLast;

  const _TimelineItem({required this.event, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!isLast)
          Positioned(
            left: 7, // center of the 16x16 dot
            top: 16,
            bottom: 0,
            child: Container(
              width: 2,
              color: AppColors.border,
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline Line and Dot
            SizedBox(
              width: 40,
              child: Padding(
                padding: const EdgeInsets.only(top: 6), // align with text
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: AppColors.accentPrimary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accentPrimary.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      event.year,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.accentSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      event.role,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      event.company,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      event.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
