import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:todoist/core/utils/constans.dart';
import 'package:todoist/features/add_task/data/model/todoist_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());



  addTask(TodoistModel task) async{
    emit(AddTaskLoading());

    try{

      var todoistBox = Hive.box<TodoistModel>(kTodoistBox);
      await todoistBox.add(task);
      emit(AddTaskSucccess());
    }catch(e){

      emit(AddTaskFailuer(errMessage: e.toString()));
    }
  }
}
