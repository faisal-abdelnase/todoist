import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              Text("Welcom Back!", 
              style: TextStyle(
                fontSize: 18
              ),),
              Text("Faisal", 
              style: TextStyle(
                fontSize: 24
              ),),
            ],),
        ),
      ),
    );
  }
}