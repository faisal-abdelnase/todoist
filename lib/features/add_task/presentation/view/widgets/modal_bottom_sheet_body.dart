import 'package:flutter/material.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/custom_button.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/custom_text_form_filled.dart';

class ModalBottomSheetBody extends StatelessWidget {
  const ModalBottomSheetBody({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const Text("Task Title", 
          style: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),),
          
          const SizedBox(
            height: 10,
          ),
      
          const CustomTextFormFilled(hintText: "Type Title here...", maxLine: 1,),
      
          const SizedBox(
            height: 10,
          ),
      
          const Text("Task Description", 
          style: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),),
          
          const SizedBox(
            height: 10,
          ),
      
      
          const CustomTextFormFilled(hintText: "Type Description here...", maxLine: 8,),
      
          const SizedBox(
            height: 32,
          ),
      
          CustomButton(text: text,),
      
        ],
      ),
    );
  }
}

