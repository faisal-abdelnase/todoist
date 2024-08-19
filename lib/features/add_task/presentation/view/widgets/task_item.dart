import 'package:flutter/material.dart';
import 'package:todoist/core/utils/constans.dart';
import 'package:todoist/features/add_task/data/model/todoist_model.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/custom_icon_buttons.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key, required this.todoistModel});

  final TodoistModel todoistModel;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: bodyGray,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.todoistModel.title,
              style: TextStyle(
                  decoration: widget.todoistModel.isFinsh
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                  color: Colors.white,
                  fontSize: 24),
            ),
            subtitle: Text(
              widget.todoistModel.subtitle,
              style: TextStyle(
                color: gray,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.todoistModel.date,
                  style: TextStyle(
                    color: gray,
                  ),
                ),
                CustomIconButtons(
                  todoistModel: widget.todoistModel,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
