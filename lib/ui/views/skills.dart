import 'package:flutter/material.dart';
import 'package:portfolio/config/app_theme.dart';
import 'package:portfolio/data/temp_data.dart';
import 'package:portfolio/model/skill_model.dart';
import 'package:portfolio/ui/widgets/desktop_widget.dart';
import 'package:portfolio/ui/widgets/spacer.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesktopWidget(
      title: skillsTitle,
      leftChild: const Expanded(child: SkillPoints()),
      rightChild: const Expanded(child: SkillChart()),
    );
  }
}

class SkillPoints extends StatelessWidget {
  const SkillPoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: skillPoints.map((e) => SkillPoint(e)).toList(),
    );
  }
}

class SkillPoint extends StatelessWidget {
  final String point;
  const SkillPoint(
    this.point, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Bullets(),
          Expanded(
            child: Text(
              point,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
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
      children: skillChartList.map((e) => SkillWidget(skill: e)).toList(),
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
