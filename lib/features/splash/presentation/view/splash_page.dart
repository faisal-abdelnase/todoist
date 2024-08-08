import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todoist/features/register_using_name/presentation/view/register_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{

  AnimationController? _controller;
  Animation<double>? _animation;
  

  @override
  void initState() {
    super.initState();


    _controller = AnimationController(
      duration: const  Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeIn);

    _controller?.forward();


    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const RegisterPage ()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}