import 'package:flutter/material.dart';
import 'package:todoist/core/utils/constans.dart';
import 'package:todoist/features/add_task/presentation/view/widgets/modal_bottom_sheet_body.dart';

class EditTaskPage extends StatelessWidget {
  const EditTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rock,
      body: const SingleChildScrollView(
        child: ModalBottomSheetBody(text: "Update Task",)),
    );
  }
}