import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view/widget/task_detail.dart';
import 'package:todo/view_model/theme_view_model.dart';
import 'package:todo/view_model/todo_view_model.dart';
import 'package:todo/view_model/user_view_model.dart';

class CardList extends StatelessWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer3<UserViewModel, TodoViewModel, ThemeViewModel>(
      builder: ((context, userVM, todoVM, themeVM, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Tasks',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: themeVM.themeData.colorScheme.onSurface,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => userVM.signOut(),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      themeVM.themeData.colorScheme.secondary,
                    ),
                  ),
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                      color: themeVM.themeData.colorScheme.onSecondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: todoVM.allTitles.length,
              itemBuilder: (context, index) {
                String? title = todoVM.allTitles[index]?.title;
                String? detail = todoVM.allTitles[index]?.detail;
                if (title == null) return null;
                return ListTile(
                  title: Container(
                      decoration: BoxDecoration(
                        color: themeVM.themeData.colorScheme.onSurface,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: themeVM.themeData.colorScheme.onPrimary,
                          ),
                        ),
                      )),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return TaskDetail(
                          title: title,
                          detail: detail,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        );
      }),
    );
  }
}
