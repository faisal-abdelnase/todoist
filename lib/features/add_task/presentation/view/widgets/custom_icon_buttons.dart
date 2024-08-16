import 'package:flutter/material.dart';
import 'package:todoist/core/utils/colors.dart';
import 'package:todoist/features/add_task/presentation/view/edit_task_page.dart';


class CustomIconButtons extends StatefulWidget {
  const CustomIconButtons({
    super.key,
  });

  @override
  State<CustomIconButtons> createState() => _CustomIconButtonsState();
}

class _CustomIconButtonsState extends State<CustomIconButtons> {

  bool isCheck = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const EditTaskPage()));
          }, 
          icon: Icon(Icons.edit, 
          color: teal),
          ),

          IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.delete, 
          color: red),
          ),

          Checkbox(
            side: const BorderSide(
              color: Colors.white
            ),

            activeColor: Colors.yellow,
            
            value: isCheck, 
            onChanged: (value){
              isCheck = value!;
              setState(() {
                
              });
            }
            ),
      ],
    );
  }
}