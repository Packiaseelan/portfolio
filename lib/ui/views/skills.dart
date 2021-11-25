import 'package:flutter/material.dart';
import 'package:portfolio/config/app_theme.dart';
import 'package:portfolio/ui/widgets/desktop_widget.dart';
import 'package:portfolio/ui/widgets/spacer.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DesktopWidget(
      title: 'SKILLS',
      leftChild: Expanded(child: SkillPoints()),
      rightChild: Expanded(child: SkillChart()),
    );
  }
}

class SkillPoints extends StatelessWidget {
  const SkillPoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: skills
          .map((e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Bullets(),
                    Expanded(
                      child: Text(
                        e,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}

class Bullets extends StatelessWidget {
  const Bullets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 10,
        width: 10,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.primaryColor,
        ),
      ),
    );
  }
}

class SkillChart extends StatelessWidget {
  const SkillChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...skillChartList.map((e) => SkillWidget(skill: e)).toList(),
      ],
    );
  }
}

class SkillWidget extends StatelessWidget {
  final SkillModel skill;
  const SkillWidget({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.45;
    var widthPercentage = width * (skill.percentage / 100);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SpacerWidget.vertical(height: 10),
          Container(
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black26),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    width: width,
                    height: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF766ff7),
                          Color(0xFFa1effd),
                        ],
                      ),
                    ),
                    width: widthPercentage,
                    height: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

var skills = [
  'In-depth understanding of computer programming language and ability to code',
  'Knowledge of most types of graphic design software, including object oriented management and metadata management software',
  'Active listening skills to truly hear feedback and incorporate notes effectively',
  'Ability to think creatively and find unique solutions to problems',
  'Strong communication skills to effectively speak with people at any level of an organization from subordinates to supervisors',
];

var skillChartList = [
  SkillModel('Flutter', 80),
  SkillModel('Dart', 75),
  SkillModel('SwiftUI', 70),
  SkillModel('Xamarin', 70),
];

class SkillModel {
  final String title;
  final double percentage;

  SkillModel(this.title, this.percentage);
}