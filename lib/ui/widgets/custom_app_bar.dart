import 'package:flutter/material.dart';
import 'package:portfolio/config/app_theme.dart';
import 'package:portfolio/ui/utils/enumerations.dart';
import 'package:portfolio/ui/widgets/menu_items.dart';

class CustomAppBar extends StatelessWidget {
  final Function(Menu) menuCallBack;
  const CustomAppBar({Key? key, required this.menuCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _DesktopAppBar(
      menuCallBack: menuCallBack,
    );
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: _DesktopAppBar(menuCallBack: menuCallBack),
      // child:  _MobileAppBar(),
    );
  }
}

class _DesktopAppBar extends StatelessWidget {
  final Function(Menu) menuCallBack;
  const _DesktopAppBar({Key? key, required this.menuCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text(
        //   'PACKIASEELAN',
        //   style: Theme.of(context)
        //       .textTheme
        //       .headline4!
        //       .copyWith(color: AppTheme.white),
        // ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppTheme.secondaryColor.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              bottomLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'PS',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: AppTheme.primaryColor),
            ),
          ),
        ),
        const Spacer(),
        MenuItems(menuCallBack: menuCallBack),
      ],
    );
  }
}

class _MobileAppBar extends StatelessWidget {
  const _MobileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.menu,
          color: AppTheme.white,
        ),
        const Spacer(),
        Text(
          'PACKIASEELAN',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: AppTheme.white),
        ),
      ],
    );
  }
}
