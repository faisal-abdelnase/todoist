import 'package:flutter/material.dart';
import 'package:todoist/core/utils/constans.dart';

class CustomTextFormFilled extends StatelessWidget {
  const CustomTextFormFilled({
    super.key, required this.maxLine, required this.hintText, required this.onChanged,
  });

  final int maxLine;
  final String hintText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onChanged: onChanged,
      validator: (value) {
        if(value!.isEmpty){
          return "filed is require";
        }
    
        return null;
      },
    
      style: const TextStyle(color: Colors.white),
      maxLines: maxLine,
      cursorColor: papaya,
      
      decoration: InputDecoration(
        hintText: hintText,
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

