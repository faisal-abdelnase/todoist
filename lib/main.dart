import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoist/core/utils/constans.dart';
import 'package:todoist/features/add_task/data/model/todoist_model.dart';
import 'package:todoist/features/add_task/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:todoist/features/splash/presentation/view/splash_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoistModelAdapter());
  await Hive.openBox<TodoistModel>(kTodoistBox);
  runApp(const Todoist());
}

class Todoist extends StatelessWidget {
  const Todoist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTasksCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
