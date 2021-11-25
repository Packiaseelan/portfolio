import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/spacer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _DesktopHomeView();
  }
}

class _DesktopHomeView extends StatelessWidget {
  const _DesktopHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/images/photo.png',
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HELLO EVERYBODY, I AM',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SpacerWidget.vertical(),
                  Text(
                    'PACKIASEELAN',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SpacerWidget.vertical(),
                  Text(
                    'Flutter Developer',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SpacerWidget.vertical(height: 50),
                  Text(
                    'A Mobile application developer with 5+ years of experience in Software Development, Application Maintenance and Support and Project Execution in Android and iOS using Flutter and Xamarin.',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  // Text(
                  //   'Bring your brand to life with our help.',
                  //   style: Theme.of(context).textTheme.headline1,
                  // )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
