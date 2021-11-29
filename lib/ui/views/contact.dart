import 'package:flutter/material.dart';
import 'package:sample/ui/widgets/circle_button.dart';
import 'package:sample/ui/widgets/content.dart';
import 'package:sample/ui/widgets/icon_button.dart';
import 'package:sample/ui/widgets/maps.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ContentWidget(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const MapsWidget(),
          const SizedBox(height: 20),
          Text(
            'Keep in touch',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 20),
          const ContactDetails(),
          const SizedBox(height: 20),
          const SocialMedia(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ContactDetails extends StatelessWidget {
  const ContactDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Connect with me anytime from anywhere in the world virtually.'),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButtonWidget(iconPath: 'assets/icons/phone.svg', title: 'Phone', onPressed: () {}),
            IconButtonWidget(iconPath: 'assets/icons/skype.svg', title: 'Skype', onPressed: () {}),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButtonWidget(iconPath: 'assets/icons/whatsapp.svg', title: 'WhatsApp', onPressed: () {}),
            IconButtonWidget(iconPath: 'assets/icons/email.svg', title: 'E-mail', onPressed: () {}),
          ],
        ),
      ],
    );
  }
}

class SocialMedia extends StatelessWidget {
  const SocialMedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Find me in Social Media.'),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleButtonWidget(iconPath: 'assets/icons/facebook.svg', onPressed: (){}),
            CircleButtonWidget(iconPath: 'assets/icons/twitter.svg', onPressed: (){}),
            CircleButtonWidget(iconPath: 'assets/icons/instagram.svg', onPressed: (){}),
          ],
        )
      ],
    );
  }
}
