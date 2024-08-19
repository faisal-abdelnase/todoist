import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoist/features/add_task/data/model/todoist_model.dart';
import 'package:todoist/features/add_task/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/custom_button.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/custom_text_form_filled.dart';

class EditTaskBody extends StatefulWidget {
  const EditTaskBody({super.key, required this.text, required this.todoistModel});

  final String text;

  final TodoistModel todoistModel;

  @override
  State<EditTaskBody> createState() => _EditTaskBodyState();
}

class _EditTaskBodyState extends State<EditTaskBody> {

  String? title, subTitle;
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
      
          CustomTextFormFilled(
            onChanged: (value) {
              title = value;
            },
            hintText: "Type Title here...", 
            maxLine: 1,),
      
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
      
      
          CustomTextFormFilled(
            onChanged: (value) {
              subTitle = value;
            },
            hintText: "Type Description here...", 
            maxLine: 8,),
      
          const SizedBox(
            height: 32,
          ),
      
          CustomButton(
            isLoading: false,
            onTap: () {
              widget.todoistModel.title = title ?? widget.todoistModel.title;
              widget.todoistModel.subtitle = subTitle ?? widget.todoistModel.subtitle;
              widget.todoistModel.save();

              BlocProvider.of<GetTasksCubit>(context).getAllTasks();
              Navigator.of(context).pop();
            },
            text: widget.text,),
      
        ],
      ),
    );
  }
}