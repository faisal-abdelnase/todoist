import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key, required this.textButton, required this.buttonColor, required this.onPressed,
  });

  final String textButton;
  final Color buttonColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
      ),
      onPressed: onPressed, 
      child: Text(textButton, 
      style: const TextStyle(
        color: Colors.white,
      ),),
      );
  }
}