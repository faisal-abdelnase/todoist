import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todoist/features/add_task/data/model/todoist_model.dart';
import 'package:todoist/features/add_task/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:todoist/features/add_task/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/custom_button.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/custom_text_form_filled.dart';

class ModalBottomSheetBody extends StatefulWidget {
  const ModalBottomSheetBody({
    super.key,
    required this.text,
  });
  final String text;

  @override
  State<ModalBottomSheetBody> createState() => _ModalBottomSheetBodyState();
}

class _ModalBottomSheetBodyState extends State<ModalBottomSheetBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) {
          if (state is AddTaskFailuer) {
          } else if (state is AddTaskSucccess) {
            BlocProvider.of<GetTasksCubit>(context).getAllTasks();
            Navigator.pop(context);
            setState(() {
              
            });
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Task Title",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormFilled(
                    onChanged: (value) {
                      title = value;
                    },
                    hintText: "Type Title here...",
                    maxLine: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Task Description",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormFilled(
                    onChanged: (value) {
                      subTitle = value;
                    },
                    hintText: "Type Description here...",
                    maxLine: 8,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  BlocBuilder<AddTaskCubit, AddTaskState>(
                    builder: (context, state) {
                      return CustomButton(
                        isLoading: state is AddTaskLoading ? true : false,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            var currentDate = DateFormat('EE, MMM d, y')
                                .format(DateTime.now());

                            var todoistModel = TodoistModel(
                                title: title!,
                                subtitle: subTitle!,
                                date: currentDate);

                            BlocProvider.of<AddTaskCubit>(context)
                                .addTask(todoistModel);
                                  
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                        text: widget.text,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
