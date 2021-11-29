import 'package:flutter/material.dart';
import 'package:sample/main.dart';
import 'package:sample/ui/widgets/circle_button.dart';

class Header extends StatelessWidget {
  final String title;
  const Header(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline4),
        CircleButtonWidget(
          iconPath: isDarkTheme ? 'assets/icons/sun.svg' : 'assets/icons/moon.svg',
          onPressed: () {
            themeNotifier.value = themeNotifier.value == ThemeMode.light
                ? ThemeMode.dark
                : ThemeMode.light;
          },
        )
      ],
    );
  }
}
