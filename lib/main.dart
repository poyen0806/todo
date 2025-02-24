import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/view/page/home_page.dart';
import 'package:todo/view_model/error_message_model.dart';
import 'package:todo/view_model/theme_view_model.dart';
import 'package:todo/view_model/todo_view_model.dart';
import 'package:todo/view_model/user_view_model.dart';

/// App 的主要入口點，這裡初始化了所有需要的資源並啟動應用程式。
Future<void> main() async {
  // 確保 Flutter 的綁定初始化完成
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化 Firebase 專案相關設定
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserViewModel(),
        ),
        ChangeNotifierProxyProvider<UserViewModel, TodoViewModel>(
          create: (context) => TodoViewModel(context.read()),
          update: (context, value, previous) => TodoViewModel(value),
        ),
        ChangeNotifierProvider(
          create: (_) => ErrorMessageModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo-list',
        home: Consumer<ThemeViewModel>(
          builder: (context, themeVM, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeVM.themeData,
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}
