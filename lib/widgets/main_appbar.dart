
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {

  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: const [
          // Switch(
          //   value: themeManager.themeMode == ThemeMode.dark,
          //   onChanged: (newValue) {
          //       themeManager.toggleTheme(newValue);
          //     }
          //   ),
          ],
      );
  }
    
}