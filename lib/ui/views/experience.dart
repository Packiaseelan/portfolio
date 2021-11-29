import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:sample/models/experience.dart';
import 'package:sample/ui/widgets/content.dart';
import 'package:sample/utils/get_size.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ContentWidget(
        children: [
          const OverAllExp(),
          ...experiences.map((e) => ExperienceWidget(e)).toList(),
        ],
      ),
    );
  }
}

class OverAllExp extends StatelessWidget {
  const OverAllExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var exp = overAllExpCalc();
    return ClayContainer(
      emboss: true,
      color: Theme.of(context).colorScheme.background,
      borderRadius: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Text('Total'),
            const Spacer(),
            ...exp.entries.map((v) => ExpTile(v)).toList(),
          ],
        ),
      ),
    );
  }
}

class ExpTile extends StatelessWidget {
  final MapEntry<String, int> map;
  const ExpTile(this.map, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClayContainer(
        color: Theme.of(context).colorScheme.background,
        width: 60,
        height: 60,
        borderRadius: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClayContainer(
            color: Theme.of(context).colorScheme.background,
            emboss: true,
            borderRadius: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(map.value.toString()),
                  Text(
                    map.key,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 7),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  final ExperienceModel experience;
  const ExperienceWidget(this.experience, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ClayContainer(
        emboss: true,
        width: size.width * 0.8,
        height: 150,
        borderRadius: 10,
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      experience.joiningDate.year.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      getStr(),
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.7),
                  ),
                  width: size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(experience.position),
                      Text(
                        experience.nameOfOrganization,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(calc(
                          experience.joiningDate, experience.relievingDate)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getStr() {
    var month = getMonthString(experience.joiningDate.month);
    var current = 'Present';
    if (experience.relievingDate != null) {
      current =
          '${getMonthString(experience.relievingDate!.month)} ${experience.relievingDate!.year}';
    }

    return '$month To $current';
  }
}
