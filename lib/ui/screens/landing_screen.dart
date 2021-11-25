import 'package:flutter/material.dart';
import 'package:portfolio/config/app_theme.dart';
import 'package:portfolio/ui/utils/enumerations.dart';
import 'package:portfolio/ui/views/views.dart';
import 'package:portfolio/ui/widgets/custom_app_bar.dart';
import 'package:portfolio/ui/widgets/footer.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  Menu selectedMenu = Menu.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
             width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.primaryColor,
                  AppTheme.secondaryColor,
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                CustomAppBar(menuCallBack: _onChangeMenu),
                _buildContent(),
                const FooterWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.4),
          ),
          child: _getContent(),
        ),
      ),
    );
  }

  Widget _getContent() {
    switch (selectedMenu) {
      case Menu.home:
        return const HomeView();
      case Menu.about:
        return const AboutView();
      case Menu.skill:
        return const SkillsView();
      case Menu.experience:
        return const ExperienceView();
      case Menu.contact:
        return const ContactsView();
    }
  }

  void _onChangeMenu(Menu menu) {
    setState(() {
      selectedMenu = menu;
    });
  }
}
