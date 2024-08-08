import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoist/core/utils/colors.dart';

class DateTimeFormat extends StatelessWidget {
  const DateTimeFormat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Expanded(
              
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: papaya,
                ),
                child: Text(DateFormat('EEEE, MMMM d, y').format( DateTime.now()).toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),),
              ),
            ),
        
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
        
              child: Icon(Icons.refresh),
            )
          ],
        ),
      );
  }
}