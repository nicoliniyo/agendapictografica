
import 'package:app/theme/theme_manager.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {

  const MainAppBar({super.key, required this.themeManager});

  final ThemeManager themeManager;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: [
          Switch(
            value: themeManager.themeMode == ThemeMode.dark,
            onChanged: (newValue) {
                themeManager.toggleTheme(newValue);
              }
            ),
          ],
      );
  }
    
}