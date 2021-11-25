import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/description_text.dart';
import 'package:portfolio/ui/widgets/desktop_widget.dart';
import 'package:portfolio/ui/widgets/spacer.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesktopWidget(
      title: 'ABOUT MYSELF',
      leftChild: Expanded(
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: const [
                DescriptionText('I enjoy taking complex problems and turning them into simple and beautiful app. I also love the logic and structure of coding and always strive to write elegant and efficient code.'),
                SpacerWidget.vertical(),
                DescriptionText('Experienced mobile app developer who has a track record of success creating apps that are both well-received and commercially viable. Skilled with working as a team and incorporating input into projects. Ability to always look for ways to improve upon an already existing app to keep people downloading it and enjoying it. Strong eye for detail and tenacity to never quit on something until it is absolutely perfect.'),
              ],
            ),
          ),
        ),
      ),
      rightChild: Expanded(child: Container(color: Colors.yellow)),
    );
  }
}
