import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:sample/config/app_theme.dart';

class Indicator extends StatelessWidget {
  final int count;
  final int index;
  const Indicator({
    Key? key,
    required this.count,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClayContainer(
        height: 20,
        width: double.infinity,
        emboss: true,
        color: Theme.of(context).colorScheme.background,
        borderRadius: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            count,
            (pos) => 
            ClayContainer(
              height: 8,
              width: 8,
              borderRadius: 10,
              spread: index == pos ? 0 : 6,
              color: index != pos ? Theme.of(context).colorScheme.background :AppTheme.primaryTextColor,
              curveType: index == pos ? CurveType.concave : CurveType.none,
            ),
          ),
        ),
      ),
    );
  }
}
