import 'package:flutter/material.dart';
import '../../../common_widgets/cinematic_background.dart';
import '../../../common_widgets/glass_navbar.dart';
import '../../hero/presentation/hero_section.dart';
import '../../projects/presentation/projects_section.dart';
// import '../../ai_playground/presentation/ai_playground_section.dart';
import '../../timeline/presentation/timeline_section.dart';
import '../../skills/presentation/skills_section.dart';
import '../../contact/presentation/contact_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CinematicBackground(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              pageSnapping: true,
              children: const [
                _SectionWrapper(child: HeroSection()),
                _SectionWrapper(child: ProjectsSection()),
                // _SectionWrapper(child: AiPlaygroundSection()),
                _SectionWrapper(child: TimelineSection()),
                _SectionWrapper(child: SkillsSection()),
                _SectionWrapper(child: ContactSection()),
              ],
            ),
            // Floating Navbar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: GlassNavbar(pageController: _pageController),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionWrapper extends StatelessWidget {
  final Widget child;
  const _SectionWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Center(
              child: child,
            ),
          ),
        );
      },
    );
  }
}
