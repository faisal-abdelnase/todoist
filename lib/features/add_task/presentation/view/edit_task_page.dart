import 'package:flutter/material.dart';
import 'package:todoist/core/utils/constans.dart';
import 'package:todoist/features/add_task/data/model/todoist_model.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/edit_task_body.dart';

class EditTaskPage extends StatelessWidget {
  const EditTaskPage({super.key, required this.todoistModel});

  final TodoistModel todoistModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rock,
      body: SingleChildScrollView(
        child: EditTaskBody(text: "Update Task", todoistModel: todoistModel,)),
    );
  }
}