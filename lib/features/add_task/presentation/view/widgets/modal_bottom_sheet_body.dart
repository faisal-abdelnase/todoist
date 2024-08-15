import 'package:flutter/material.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/custom_button.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/custom_text_form_filled.dart';

class ModalBottomSheetBody extends StatelessWidget {
  const ModalBottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
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
      
      
          const CustomTextFormFilled(hintText: "Type Description here...", maxLine: 5,),

          const SizedBox(
            height: 20,
          ),

          CustomButton(),
      
        ],
      ),
    );
  }
}

