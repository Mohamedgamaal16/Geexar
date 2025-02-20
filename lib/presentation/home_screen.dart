import 'package:flutter/material.dart';
import 'package:geexar/presentation/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: HomeScreenBody(),
      )),
    );
  }
}
