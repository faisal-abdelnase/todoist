import 'package:flutter/material.dart';
import 'package:todoist/core/utils/constans.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/dialog_button.dart';

class DeletedDialog extends StatelessWidget {
  const DeletedDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.warning,
          color: red,
          size: 40,
          ),
    
          const SizedBox(
            height: 20,
          ),
    
        Text("Alert", 
        style: TextStyle(
          color: gray,
          fontSize: 24,
        ),),
    
        const SizedBox(
            height: 30,
          ),
    
        const Align(
          alignment: Alignment.topLeft,
          child: Text("Are you Sure?", 
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),),
        ),
    
        const SizedBox(
            height: 30,
          ),
    
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DialogButton(
              textButton: "Yes", 
              buttonColor: red,
              onPressed: () {
                Navigator.of(context).pop();
              },
              ),
    
            const SizedBox(
            width: 10,
          ),
            DialogButton(
              textButton: "No", 
              buttonColor: rock,
              onPressed: () {
                Navigator.of(context).pop();
              },
              ),
    
          ],
        ),
    
      ],
        ),
    );
  }
}

