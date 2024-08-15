import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoist/core/utils/colors.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/custom_icon_buttons.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/date_time_format.dart';

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


              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: bodyGray,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text("Learn with Faisal", 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24
                      ),),
                      subtitle: Text("Flutter Course Todo App", 
                      style: TextStyle(
                        color: gray,
                      ),),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(DateFormat('EE, MMM d, y').format( DateTime.now()).toString(), 
                          style: TextStyle(
                            color: gray,
                          ),),

                          const CustomIconButtons(),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),


            ],),

        ),
      ),
    );
  }
}

