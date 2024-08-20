import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todoist/core/utils/constans.dart';
import 'package:todoist/features/add_task/data/model/todoist_model.dart';
import 'package:todoist/features/add_task/presentation/view/add_task_page.dart';

class DateTimeFormat extends StatelessWidget {
  const DateTimeFormat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Row(
          children: [
            Expanded(
              
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: papaya,
                ),
                child: Text(DateFormat('EEEE, MMMM d, y').format( DateTime.now()).toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),),
              ),
            ),

            const SizedBox(
              width: 10,
            ),
        
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: bodyGray.withOpacity(1),
              ),
        
              child: IconButton(
                onPressed: () {
                  var todoistBox = Hive.box<TodoistModel>(kTodoistBox);
                  todoistBox.clear();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=> const TasksPage()));
                },
                icon:const Icon(
                  Icons.refresh,
                  color: Colors.white,
                  ),
                
                ),
            ),
          ],
        ),
      );
  }
}