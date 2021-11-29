import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:sample/config/app_theme.dart';
import 'package:sample/models/skills.dart';
import 'package:sample/ui/widgets/content.dart';
import 'package:sample/utils/get_size.dart';

var skills = [
  SkillsModel('Flutter', 90),
  SkillsModel('Dart', 90),
  SkillsModel('SwiftUI', 50),
  SkillsModel('Xamarin', 70),
];

var chip = ['Flutter', 'Dart', 'Xamarin', 'SwiftUI', 'Andriod', 'iOS'];

class SkillsView extends StatelessWidget {
  const SkillsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ContentWidget(
        children: [
          Wrap(
            children: chip.map((e) => SkillChip(e)).toList(),
          ),
          const SizedBox(height: 20),
          ...skills
              .map(
                (e) => SkillProgress(
                  title: e.title,
                  percentage: e.percentage,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

class SkillProgress extends StatelessWidget {
  final String? title;
  final double? percentage;
  const SkillProgress({Key? key, this.title, this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return const SizedBox();
    }
    var size = getSize(context);
    var width = size.width * 0.8;
    var widthPercentage = width * (percentage! / 100);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 10),
        ClayContainer(
          height: 15,
          width: width,
          color: Theme.of(context).colorScheme.background,
          emboss: true,
          borderRadius: 20,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              children: [
                Container(
                  width: widthPercentage,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryTextColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                // AnimatedContainer(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     color: AppTheme.primaryTextColor.withOpacity(0.3),
                //   ),
                //   duration: Duration(seconds: 10),
                //   width: widthPercentage,
                // ),
                Expanded(child: Container())
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class SkillChip extends StatelessWidget {
  final String skill;
  const SkillChip(this.skill, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, bottom: 10),
      child: ClayContainer(
        borderRadius: 20,
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(skill),
        ),
      ),
    );
  }
}

// class ProgressBar extends StatefulWidget {
//   const ProgressBar({ Key? key }) : super(key: key);

//   @override
//   _ProgressBarState createState() => _ProgressBarState();
// }

// class _ProgressBarState extends State<ProgressBar> with SingleTickerProviderStateMixin{
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//           color: Colors.amber,
//           duration: new Duration(milliseconds: 500),
//           height: height,
//         );
//   }
// }
