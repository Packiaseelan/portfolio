import 'package:flutter/material.dart';
import 'package:portfolio/data/temp_data.dart';
import 'package:portfolio/ui/widgets/desktop_widget.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesktopWidget(
      title: contactTitle,
      leftChild: Expanded(child: Container(color: Colors.red)),
      rightChild: Expanded(child: Container(color: Colors.yellow)),
    );
  }
}