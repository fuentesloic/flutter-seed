import 'package:flutter/material.dart';
import 'package:flutter_seed/pages/landing.dart';
import 'package:flutter_seed/theme.dart';

class SeederApp extends StatelessWidget {
  const SeederApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Seed',
      debugShowCheckedModeBanner: false,
      theme: darkTheme(),
      home: const LandingPage(),
    );
  }
}
