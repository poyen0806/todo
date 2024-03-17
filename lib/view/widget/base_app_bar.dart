import 'package:flutter/material.dart';
import 'package:todo/view/widget/theme_switcher.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Row(
          children: [
            Spacer(),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ThemeSwitcher(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
