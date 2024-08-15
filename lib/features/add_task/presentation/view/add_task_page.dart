import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoist/core/utils/colors.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/custom_text_form_filled.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/date_time_format.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/task_info_card.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  late String name;
  


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
      floatingActionButton: FloatingActionButton(
        backgroundColor: papaya,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: rock,
            context: context, 
            builder: (BuildContext context){
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
                
                    CustomTextFormFilled()
                  ],
                ),
              );
            }
            );
        },

        child: const Icon(Icons.add),
      ),
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

              const DateTimeFormat(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Today Task's",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24
                    ),),

                    Container(
                      width: 30,
                      height: 40,
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: papaya,
                      ),
                      child: const Center(
                        child: Text("1", 
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),)),
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
                      child: Text("See All", 
                      style: TextStyle(
                        color: Colors.white
                      ),),
                    ),
                  ),
              ),


              const TaskInfoCard(),

            ],),

        ),
      ),
    );
  }
}

