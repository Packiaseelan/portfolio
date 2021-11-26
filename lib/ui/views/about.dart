import 'package:flutter/material.dart';
import 'package:portfolio/data/temp_data.dart';
import 'package:portfolio/ui/widgets/description_text.dart';
import 'package:portfolio/ui/widgets/desktop_widget.dart';
import 'package:portfolio/ui/widgets/spacer.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesktopWidget(
      title: aboutTitle,
      leftChild: Expanded(
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DescriptionText(aboutDescription1),
                const SpacerWidget.vertical(),
                DescriptionText(aboutDescription2),
              ],
            ),
          ),
        ),
      ),
      rightChild: Expanded(
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: DescriptionText(aboutDescription3),
          ),
        ),
      ),
    );
  }
}
