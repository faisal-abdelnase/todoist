part of 'get_tasks_cubit.dart';

@immutable
sealed class GetTasksState {}

final class GetTasksInitial extends GetTasksState {}
final class GetTasksSucccess extends GetTasksState {}



