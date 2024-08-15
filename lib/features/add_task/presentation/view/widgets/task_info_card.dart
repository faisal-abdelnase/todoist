import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoist/core/utils/colors.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/custom_icon_buttons.dart';

class TaskInfoCard extends StatelessWidget {
  const TaskInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              );
  }
}