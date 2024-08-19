import 'package:flutter/material.dart';
import 'package:todoist/core/utils/constans.dart';
import 'package:todoist/features/add_task/data/model/todoist_model.dart';
import 'package:todoist/features/add_task/presentation/view/add_task_page.dart';
import 'package:todoist/features/add_task/presentation/view/edit_task_page.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/deleted_dialog.dart';



class CustomIconButtons extends StatefulWidget {
  const CustomIconButtons({
    super.key, required this.todoistModel,
  });

  final TodoistModel todoistModel;

  @override
  State<CustomIconButtons> createState() => _CustomIconButtonsState();
}

class _CustomIconButtonsState extends State<CustomIconButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EditTaskPage(todoistModel: widget.todoistModel,)));
          }, 
          icon: Icon(Icons.edit, 
          color: teal),
          ),

          IconButton(
          onPressed: (){
            showDialog(
              context: context, 
              
              builder: (context){
                return Dialog(
                  backgroundColor: bodyGray,
                  child: DeletedDialog(todoistModel: widget.todoistModel,),
                );
              });
          }, 
          icon: Icon(Icons.delete, 
          color: red),
          ),

          Checkbox(
            side: const BorderSide(
              color: Colors.white
            ),

            activeColor: Colors.yellow,
            
            value: widget.todoistModel.isFinsh, 
            onChanged: (value){
              widget.todoistModel.isFinsh  = value!;
              widget.todoistModel.save();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const TasksPage()));
              setState(() {
                
              });
            }
            ),
      ],
    );
  }
}

