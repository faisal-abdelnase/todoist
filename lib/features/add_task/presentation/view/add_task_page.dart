import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoist/core/utils/colors.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/date_time_format.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  late String name;
  

  // String formatDatenow = DateFormat('EEEE, MMMM d, y').format(now);

  void initState() {
    // TODO: implement initState
    super.initState();

    getNameData();
  }


  void getNameData() async{

    SharedPreferences prefsName = await SharedPreferences.getInstance();
    name = prefsName.getString("name")!;
    setState(() {
      
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rock,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              const Text("Welcom Back!", 
              style: TextStyle(
                fontSize: 18,
                color: Colors.white
              ),),
              Text(name, 
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),),

              DateTimeFormat(),
            ],),
        ),
      ),
    );
  }
}