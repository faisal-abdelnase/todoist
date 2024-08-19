import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoist/core/utils/constans.dart';
import 'package:todoist/features/add_task/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/date_time_format.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/modal_bottom_sheet_body.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/task_item_list_view.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  String? name;

  void initState() {
    super.initState();

    BlocProvider.of<GetTasksCubit>(context).getAllTasks();

    getNameData();
  }

  void getNameData() async {
    SharedPreferences prefsName = await SharedPreferences.getInstance();
    name = prefsName.getString("name")!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTasksCubit, GetTasksState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: papaya,
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: rock,
                  context: context,
                  builder: (context) {
                    return const ModalBottomSheetBody(
                      text: "Create Task",
                    );
                  });
            },
            child: const Icon(Icons.add),
          ),
          backgroundColor: rock,
          body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "Welcom Back!",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    name ?? "",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  const DateTimeFormat(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Today Task's",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        Container(
                          width: 30,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: papaya,
                          ),
                          child: Center(
                              child: Text(
                            "${BlocProvider.of<GetTasksCubit>(context).numberOfTasks}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: bodyGray,
                      ),
                      margin: const EdgeInsets.only(right: 16, top: 16),
                      child: const Center(
                        child: Text(
                          "See All",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: TaskItemListView()),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
