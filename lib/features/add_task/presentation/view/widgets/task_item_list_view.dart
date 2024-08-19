import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoist/features/add_task/data/model/todoist_model.dart';
import 'package:todoist/features/add_task/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/task_item.dart';

class TaskItemListView extends StatelessWidget {
  const TaskItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTasksCubit, GetTasksState>(
      
      builder: (context, state) {
        List<TodoistModel> tasks = BlocProvider.of<GetTasksCubit>(context).tasks ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TaskItem(todoistModel: tasks[index],),
              );
            }),
        );
      },
    );
  }
}
