import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoist/features/add_task/presentation/view/add_task_page.dart';
import 'package:todoist/features/register_using_name/presentation/view/register_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{

  AnimationController? _controller;
  Animation<double>? _animation;
  String? name;
  

  @override
  void initState() {
    super.initState();


    _controller = AnimationController(
      duration: const  Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeIn);

    _controller?.forward();

    getNameData();


    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          if(name == null){
            return const RegisterPage ();
          }

          else{
            return const TasksPage();
          }
          
        } ),
      );
    });
  }


  void getNameData() async{

    SharedPreferences prefsName = await SharedPreferences.getInstance();
    name = prefsName.getString("name")!;
    setState(() {
      
    });
  }


  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation!,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/task.png')),

                SizedBox(
                  height: 40,
                ),

                Text("TODOIST", 
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Ga Maamli',
                ),),
            ],
          ),
        ),
      ),
    );
  }
}