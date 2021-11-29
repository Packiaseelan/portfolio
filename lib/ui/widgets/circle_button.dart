import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample/config/app_theme.dart';

class CircleButtonWidget extends StatelessWidget {
  final String iconPath;
  final Function onPressed;

  const CircleButtonWidget({
    Key? key,
    required this.iconPath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      height: 50,
      width: 50,
      borderRadius: 25,
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClayContainer(
          color: Theme.of(context).colorScheme.background,
          emboss: true,
          borderRadius: 25,
          child: RawMaterialButton(
            shape: const CircleBorder(),
            onPressed: () => onPressed(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                iconPath,
                width: 15,
                color: AppTheme.primaryTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
