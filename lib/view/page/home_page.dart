import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view/widget/card_list.dart';
import 'package:todo/view/widget/task_create.dart';
import 'package:todo/view/widget/theme_switcher.dart';
import 'package:todo/view_model/theme_view_model.dart';
import 'package:todo/view_model/todo_view_model.dart';
import 'package:todo/view_model/user_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<UserViewModel, TodoViewModel, ThemeViewModel>(
      builder: (context, userVM, todoVM, themeVM, child) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (userVM.user == null)
                    ElevatedButton(
                      onPressed: () => userVM.signInWithGoogle(),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          themeVM.themeData.colorScheme.secondary,
                        ),
                      ),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: themeVM.themeData.colorScheme.onSecondary,
                        ),
                      ),
                    )
                  else
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/todo.png',
                              width: 200,
                              height: 100,
                            ),
                            const Spacer(),
                            const ThemeSwitcher(),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 500,
                                decoration: BoxDecoration(
                                  color: themeVM.themeData.colorScheme.surface,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                width: double.infinity,
                                child: const Padding(
                                  padding: EdgeInsets.all(30),
                                  child: TaskCreate(),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              flex: 7,
                              child: Container(
                                height: 500,
                                decoration: BoxDecoration(
                                  color: themeVM.themeData.colorScheme.surface,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                width: double.infinity,
                                child: const Padding(
                                  padding: EdgeInsets.all(30),
                                  child: CardList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
