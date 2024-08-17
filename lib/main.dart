import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoist/features/add_task/data/model/todoist_model.dart';
import 'package:todoist/features/splash/presentation/view/splash_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<TodoistModel>("todositBox");
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