import 'package:flutter/material.dart';
import 'package:todoist/core/utils/constans.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text, required this.onTap, required this.isLoading,
  });
  final String text;
  final Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
      
        decoration: BoxDecoration(
          color: papaya,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isLoading 
        ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
        
        :Center(
          child: Text(text, 
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),)),
      ),
    );
  }
}

