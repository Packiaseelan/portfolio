import 'package:flutter/material.dart';
import 'package:portfolio/config/app_theme.dart';

class DescriptionText extends StatelessWidget {
  final String text;
  const DescriptionText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(color: AppTheme.primaryTextColorLight, height: 2),
      textAlign: TextAlign.justify,
    );
  }
}
