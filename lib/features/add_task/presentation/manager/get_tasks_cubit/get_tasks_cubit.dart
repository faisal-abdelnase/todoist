import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:todoist/core/utils/constans.dart';
import 'package:todoist/features/add_task/data/model/todoist_model.dart';

part 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit() : super(GetTasksInitial());

  List<TodoistModel>? tasks;

  int numberOfTasks = 0;

  getAllTasks(){

    var todoistBox = Hive.box<TodoistModel>(kTodoistBox);

    tasks = todoistBox.values.toList();

    if(tasks == null){
      numberOfTasks = 0;
    }
    else{
      numberOfTasks = tasks!.length;
    }
    emit(GetTasksSucccess());
  }
}
