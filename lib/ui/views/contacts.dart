import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'package:portfolio/data/temp_data.dart';
import 'package:portfolio/ui/widgets/desktop_widget.dart';
import 'package:portfolio/ui/widgets/spacer.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({ Key? key }) : super(key: key);

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
  const MapsWidget({ Key? key }) : super(key: key);

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
  const KeepInTouchWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Keep in touch',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SpacerWidget.vertical(height: 20),
          Text(
            'Connect with me anywhere from the world virtually.',
            style: Theme.of(context).textTheme.headline6,
          ),
      ],
    );
  }
}
