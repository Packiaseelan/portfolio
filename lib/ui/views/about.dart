import 'package:flutter/material.dart';
import 'package:portfolio/config/app_theme.dart';
import 'package:portfolio/ui/widgets/desktop_widget.dart';

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
            child: Text(
              'Experienced mobile app developer who has a track record of success creating apps that are both well-received and commercially viable. Skilled with working as a team and incorporating input into projects. Ability to always look for ways to improve upon an already existing app to keep people downloading it and enjoying it. Strong eye for detail and tenacity to never quit on something until it is absolutely perfect.',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppTheme.primaryTextColorLight, height: 2),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
      rightChild: Expanded(child: Container(color: Colors.yellow)),
    );
  }
}
