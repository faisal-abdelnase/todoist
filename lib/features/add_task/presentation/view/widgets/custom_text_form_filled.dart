import 'package:flutter/material.dart';
import 'package:todoist/core/utils/colors.dart';

class CustomTextFormFilled extends StatelessWidget {
  const CustomTextFormFilled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if(value!.isEmpty){
          return "filed is require";
        }
    
        return null;
      },
    
      style: const TextStyle(color: Colors.white),
      
      decoration: InputDecoration(
        hintText: "Type Title here...",
        hintStyle: TextStyle(
          color: gray,
        ),
    
        fillColor: bodyGray,
        filled: true,
    
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: bodyGray),
          borderRadius: BorderRadius.circular(8),
        ),
    
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: papaya),
          borderRadius: BorderRadius.circular(8),
        ),
    
      ),
    );
  }
}

