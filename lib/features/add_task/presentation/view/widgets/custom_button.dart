import 'package:flutter/material.dart';
import 'package:todoist/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: double.infinity,
        height: 50,
      
        decoration: BoxDecoration(
          color: papaya,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text("Create Task", 
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),)),
      ),
    );
  }
}

