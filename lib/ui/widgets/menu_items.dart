import 'package:flutter/material.dart';
import 'package:portfolio/ui/utils/enumerations.dart';

class MenuItems extends StatelessWidget {
  final Function(Menu) menuCallBack;
  final Menu selectedMenu;
  const MenuItems({Key? key, required this.menuCallBack, required this.selectedMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Menu.values
          .map(
            (e) => InkWell(
              onTap: () => menuCallBack(e),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  e.title,
                  style: e == selectedMenu ? Theme.of(context).textTheme.headline5 : Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
