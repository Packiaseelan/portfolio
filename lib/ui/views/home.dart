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
          'Senior Mobile Developer with 10 years of experience architecting and shipping high-performance iOS
and cross-platform applications for fintech, healthcare, and enterprise clients. Deep expertise in Swift,
SwiftUI, Flutter, MVVM, and Clean Architecture with a strong track record of reducing authentication
failures, accelerating feature delivery, and integrating complex systems such as Stripe payments,
HealthKit, and Server-Driven UI. Recognized for owning end-to-end product delivery, mentoring peers,
and driving scalable architecture decisions across global teams.',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(height: 1.5),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
