import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_model/theme_view_model.dart';
import 'package:todo/view_model/todo_view_model.dart';

class TaskDetail extends StatelessWidget {
  final String? title;
  final String? detail;

  const TaskDetail({
    super.key,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer2<TodoViewModel, ThemeViewModel>(
      builder: (context, todoVM, themeVM, child) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          width: 600,
          height: 400,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      todoVM.deleteTask(title!, detail!);
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        themeVM.themeData.colorScheme.secondary,
                      ),
                    ),
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        color: themeVM.themeData.colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                detail!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
