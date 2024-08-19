

import 'package:hive_flutter/adapters.dart';
part 'todoist_model.g.dart';

@HiveType(typeId: 0)

class TodoistModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  bool isFinsh;

  TodoistModel(
    {required this.title, 
    required this.subtitle, 
    required this.date, 
    required this.isFinsh});
}