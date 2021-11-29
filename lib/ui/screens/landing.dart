import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:sample/main.dart';
import 'package:sample/ui/views/views.dart';
import 'package:sample/ui/widgets/footer.dart';
import 'package:sample/ui/widgets/header.dart';
import 'package:sample/ui/widgets/indicator.dart';
import 'package:sample/utils/enumerations.dart';
import 'package:sample/utils/get_size.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _pageController = PageController(initialPage: 0);
  Menu selectedMenu = Menu.home;

  @override
  void initState() {
    super.initState();
    data.init();
  }
  
  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: ClayContainer(
            width: size.width,
            height: size.height,
            emboss: true,
            color: Theme.of(context).colorScheme.background,
            borderRadius: 10,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Header(selectedMenu.title),
                  ContentView(child: pageView()),
                  const Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget pageView() => Column(
        children: [
          Expanded(
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) => setState(() => selectedMenu = Menu.values[index]),
              children: const [
                HomeView(),
                AboutView(),
                SkillsView(),
                ExperienceView(),
                ContactView(),
              ],
            ),
          ),
          Indicator(count: 5, index: selectedMenu.index),
        ],
      );
}
