import 'package:flutter/material.dart';
import 'package:todoist/features/splash/presentation/view/splash_page.dart';

void main() {
  runApp(const Todoist());
}

class Todoist extends StatelessWidget {
  const Todoist({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}