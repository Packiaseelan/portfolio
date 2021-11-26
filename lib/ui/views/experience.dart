import 'package:flutter/material.dart';
import 'package:portfolio/data/temp_data.dart';
import 'package:portfolio/ui/widgets/desktop_widget.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesktopWidget(
      title: experienceTitle,
      leftChild: Expanded(child: Container(color: Colors.red)),
      rightChild: Expanded(child: Container(color: Colors.yellow)),
    );
  }
}