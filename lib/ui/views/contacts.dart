import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps/google_maps.dart';
import 'package:portfolio/data/temp_data.dart';
import 'package:portfolio/ui/widgets/desktop_widget.dart';
import 'package:portfolio/ui/widgets/spacer.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesktopWidget(
      title: contactTitle,
      leftChild: const Expanded(child: MapsWidget()),
      rightChild: const Expanded(child: KeepInTouchWidget()),
    );
  }
}

class MapsWidget extends StatelessWidget {
  const MapsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getMap();
  }

  Widget getMap() {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(8.799975610879025, 78.14931871175907);

      final mapOptions = MapOptions()
        ..zoom = 1
        ..center = LatLng(8.799975610879025, 78.14931871175907);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = GMap(elem, mapOptions);

      Marker(MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'Hello World!');

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}

class KeepInTouchWidget extends StatelessWidget {
  const KeepInTouchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contactSubTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SpacerWidget.vertical(height: 20),
        Text(
          contactDescription1,
          style: Theme.of(context).textTheme.headline6,
        ),
        const ContactDetails(),
        Text(
          contactDescription2,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SocialMediaWidget()
      ],
    );
  }
}

class ContactDetails extends StatelessWidget {
  const ContactDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return material.Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactIconWidget(
            title: contactPhoneNumber,
            iconPath: contactCallIconPath,
          ),
          ContactIconWidget(
            title: contactWhatsApp,
            iconPath: contactWhatsappIconPath,
          ),
          ContactIconWidget(
            title: contactEmail,
            iconPath: contactMailIconPath,
          ),
          ContactIconWidget(
            title: contactSkype,
            iconPath: contactSkypeIconPath,
          ),
        ],
      ),
    );
  }
}

class ContactIconWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final Function? onPressed;

  const ContactIconWidget({
    Key? key,
    required this.title,
    required this.iconPath,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return material.Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton.icon(
        onPressed: () => onPressed,
        icon: SvgPicture.asset(
          iconPath,
          width: 30,
        ),
        label: Text(
          title,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
    );
  }
}

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return material.Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          SvgPicture.asset(
            contactLinkedinIconPath,
            width: 30,
          ),
          const SpacerWidget.horizontal(width: 20),
          SvgPicture.asset(
            contactFacebookIconPath,
            width: 30,
          ),
          const SpacerWidget.horizontal(width: 20),
          SvgPicture.asset(
            contactInstagramIconPath,
            width: 30,
          ),
          const SpacerWidget.horizontal(width: 20),
          SvgPicture.asset(
            contactTwitterIconPath,
            width: 30,
          ),
        ],
      ),
    );
  }
}
