
import 'package:app/theme/theme_manager.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.themeManager});

  final ThemeManager themeManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes', style: Theme.of(context).textTheme.titleLarge,),
        actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: (){},
            ),
          ],
      ),
      drawer: const MainAppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    
                    const Divider(),
                    Row(
                      children: [
                        const Text('Modo oscuro'),
                        const Spacer(),
                        Switch(
                          value: (themeManager.themeMode ==  ThemeMode.dark),
                          onChanged: (newValue) {
                              themeManager.toggleTheme(newValue);
                            }
                          ),
                      ]
                    ),
                  ]
            ),
          ]
        ),

      )
    );
  }

}