import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoist/features/add_task/presentation/view/add_task_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formkey = GlobalKey();
  String? name;
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      body: Form(
        key: formkey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
            child: SingleChildScrollView(
              child: Column(
                children: [
              
                  const Text("Welcom!", 
                  style: TextStyle(
                    fontSize: 32,
                  ),),
              
                  const SizedBox(
                    height: 30,
                  ),
              
                  const CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage('assets/images/task.png')),
              
                  
                  const SizedBox(
                    height: 64,
                  ),
              
              
                  TextFormField(
        
                    validator: (value) {
                    if (value!.isEmpty) {
                      return 'This filed is require';
                    }
                    return null;
                    },
              
                    decoration: const InputDecoration(
                      hintText: "Enter your name",
                    ),
              
                    onChanged: (value) {
                      name = value;
                      
                    },

                    onFieldSubmitted: (value) {
                      name = value;

                      if (formkey.currentState?.validate() ?? false) {

                        saveNameData(name!);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const TasksPage()));
                      }
                    },
                  ),
              
                  const SizedBox(
                    height: 32,
                  ),
              
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      backgroundColor: const Color(0xffC92120),
                    ),
                    onPressed: (){
                      if (formkey.currentState?.validate() ?? false) {

                        saveNameData(name!);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const TasksPage()));
                      }
                    }, 
                    child: const Text("register", 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24
                    ),),
                    ),
              
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


saveNameData(String name) async{

  SharedPreferences prefsName = await SharedPreferences.getInstance();
      prefsName.setString("name", name);
}