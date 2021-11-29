import 'package:flutter/material.dart';
import 'package:sample/ui/widgets/content.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ContentWidget(
        children: [
          Text(
            'I build things for Android and iOS. I realy enjoy taking complex problems and turning into simple and beautiful apps. I also love the logic and structure of coding and always strive to write elegant and efficient code. And I enjoy learning languages and framework like Flutter and SwiftUI.',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20),
          Text(
            'Experienced mobile app developer who has a record of success creating apps that are both well-received and commercially viable. Skilled with working as a team and incorporating input into projects. Ability to always look for ways to improve upon an already existing app to keep people downloading it and enjoying it. Strong eye for detail and tenacity to never quit on something until it absolutely perfect.',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.5),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
