import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_model/error_message_model.dart';
import 'package:todo/view_model/theme_view_model.dart';
import 'package:todo/view_model/todo_view_model.dart';
import 'package:todo/view_model/user_view_model.dart';

class TaskCreate extends StatelessWidget {
  const TaskCreate({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    return Consumer4<UserViewModel, TodoViewModel, ThemeViewModel, ErrorMessageModel>(
      builder: (context, userVM, todoVM, themeVM, errorVM, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create a New Task',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: themeVM.themeData.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          // 標題
          TextFormField(
            controller: titleController,
            cursorColor: themeVM.themeData.colorScheme.onSurface,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              hintText: 'Enter task title',
              hintStyle: TextStyle(
                color: themeVM.themeData.colorScheme.onSurface,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: themeVM.themeData.colorScheme.secondary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: themeVM.themeData.colorScheme.onSurface,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // 詳細資訊
          TextFormField(
            controller: detailController,
            cursorColor: themeVM.themeData.colorScheme.onSurface,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 100,
                horizontal: 10,
              ),
              hintText: 'Enter task detail',
              hintStyle: TextStyle(
                color: themeVM.themeData.colorScheme.onSurface.withOpacity(0.7),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: themeVM.themeData.colorScheme.secondary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: themeVM.themeData.colorScheme.onBackground,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 61,
                child: Text(
                  errorVM.errorMessage,
                  style: TextStyle(
                    color: themeVM.themeData.colorScheme.error,
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 39,
                child: ElevatedButton(
                  onPressed: () async {
                    String todoTitle = titleController.text;
                    String todoDetail = detailController.text;
                    errorVM.errorMessage = await todoVM.createTask(todoTitle, todoDetail);
                
                    if (errorVM.errorMessage == '') {
                      titleController.clear();
                      detailController.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeVM.themeData.colorScheme.primary,
                  ),
                  child: Text(
                    'Create Task',
                    style: TextStyle(
                      color: themeVM.themeData.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
