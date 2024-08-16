import 'package:flutter/material.dart';
import 'package:todoist/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text,
  });
  final String text;

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
        child: Center(
          child: Text(text, 
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),)),
      ),
    );
  }
}

