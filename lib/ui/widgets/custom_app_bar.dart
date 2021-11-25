import 'package:flutter/material.dart';
import 'package:portfolio/config/app_theme.dart';
import 'package:portfolio/ui/utils/enumerations.dart';
import 'package:portfolio/ui/widgets/menu_items.dart';

class CustomAppBar extends StatelessWidget {
  final Function(Menu) menuCallBack;
  const CustomAppBar({Key? key, required this.menuCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _DesktopAppBar(menuCallBack: menuCallBack,);
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: _DesktopAppBar(menuCallBack: menuCallBack),
      // child:  _MobileAppBar(),
    );
  }
}

class _DesktopAppBar extends StatelessWidget {
  final Function(Menu) menuCallBack;
  const _DesktopAppBar({Key? key, required this.menuCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'PACKIASEELAN',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: AppTheme.white),
        ),
        const Spacer(),
        MenuItems(menuCallBack: menuCallBack),
      ],
    );
  }
}

class _MobileAppBar extends StatelessWidget {
  const _MobileAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Row(
      children: [
        const Icon(Icons.menu, color: AppTheme.white,),
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