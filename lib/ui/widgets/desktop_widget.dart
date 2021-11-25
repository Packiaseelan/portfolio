import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/spacer.dart';

class DesktopWidget extends StatelessWidget {
  final String title;
  final Widget leftChild;
  final Widget rightChild;

  const DesktopWidget({
    Key? key,
    required this.title,
    required this.leftChild,
    required this.rightChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SpacerWidget.vertical(height: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                leftChild,
                const SizedBox(width: 15),
                rightChild,
              ],
            ),
          )
        ],
      ),
    );
  }
}
