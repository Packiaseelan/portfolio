import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:portfolio/data/temp_data.dart';
import 'package:portfolio/ui/widgets/description_text.dart';
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
            homePhotoPath,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homeGreetingText,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SpacerWidget.vertical(),
                  Text(
                    homeName,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SpacerWidget.vertical(),
                  Text(
                    homeRole,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SpacerWidget.vertical(height: 50),
                  DescriptionText(homeSummary),
                  const SpacerWidget.vertical(height: 50),
                  OutlinedButton(
                    child: Text(
                      homeResume,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    onPressed: () {
                      js.context.callMethod(homeOpen, [homeResumePath]);
                    },
                  )
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
