import 'package:flutter/material.dart';

class SpacerWidget extends StatelessWidget {
  final double height;
  final double width;

  const SpacerWidget({
    Key? key,
    this.height = 10,
    this.width = 10,
  }) : super(key: key);

  const SpacerWidget.vertical({Key? key, this.height = 10})
      : width = 0,
        super(key: key);

  const SpacerWidget.horizontal({Key? key, this.width = 10})
      : height = 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
