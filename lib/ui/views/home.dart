import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:sample/config/app_theme.dart';
import 'package:sample/ui/widgets/content.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentWidget(
      children: [
        Text(
          'HELLO EVERYBODY, I AM',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 10),
        Text(
          'PACKIASEELAN S',
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 10),
        Text(
          'Flutter Developer',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const Spacer(),
        ClayText(
          'BE BRAVE ENOUGH\nTO STUCK AT\nSOMETHING NEW.',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                letterSpacing: 1.4,
                fontWeight: FontWeight.w900,
              ),
          color: Theme.of(context).colorScheme.background,
        ),
        const Spacer(),
        Text(
          'A mobile application developer with 5+ years of experience in Software Deelopment, Applicaton Maintenance, Support and Project Execution in Android and iOS using Flutter and Xamarin.',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(height: 1.5),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
