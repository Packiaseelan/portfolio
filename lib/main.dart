import 'package:flutter/material.dart';
import 'package:portfolio/config/app_theme.dart';
import 'package:portfolio/ui/screens/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Packiaseelan Portfolio',
      theme: AppTheme.of(context),
      home: const LandingScreen(),
    );
  }
}
