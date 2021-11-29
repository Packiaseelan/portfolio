import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:sample/config/app_theme.dart';

class ContentView extends StatelessWidget {
  final Widget? child;
  const ContentView({this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ClayContainer(
          color: Theme.of(context).colorScheme.background,
          width: double.infinity,
          borderRadius: 10,
          child: child,
        ),
      ),
    );
  }
}
