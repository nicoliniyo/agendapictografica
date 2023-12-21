import 'package:app/screens/about.dart';
import 'package:app/screens/activities.dart';
import 'package:app/screens/catalog_pecs.dart';
import 'package:app/screens/design_system.dart';
import 'package:app/screens/search.dart';
import 'package:app/screens/settings.dart';
import 'package:app/theme/theme_manager.dart';
import 'package:flutter/material.dart';

import '../theme/custom_theme.dart';
import 'build_number.dart';

ThemeManager _themeManager = ThemeManager();

class MainAppDrawer extends StatefulWidget {
  const MainAppDrawer({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppDrawer();
  }
}

class _AppDrawer extends State<MainAppDrawer> {
  int _selectedIndex = 0;
  final Widget buildNumber = const BuildNumber();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Color.fromARGB(255, 234, 236, 236)
                      ], // Adjust colors as needed
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/nicapps-logo.png', // Replace with the actual asset path
                        width: 80.0, // Adjust width as needed
                        height: 80.0, // Adjust height as needed
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'NicApps',
                        style: ThemeTextStyle.robotoText,
                      ),
                      Text('https://nicoliniyo.github.io/nicapps/',
                          style: ThemeTextStyle.roboto10Text),
                    ],
                  ),
                ),
                // DB Pecs -> SearchScreen
                ListTile(
                  title: Row(
                    children: [
                      const Icon(
                        Icons.search_outlined,
                        color: ThemeColors.primaryText,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Catalogo Pecs', style: ThemeTextStyle.robotoText),
                    ],
                  ),
                  selected: _selectedIndex == 1,
                  onTap: () {
                    _onItemTapped(1);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const CatalogPecs(),
                      ),
                    );
                  },
                ),
                // Buscar -> SearchScreen
                ListTile(
                  title: Row(
                    children: [
                      const Icon(
                        Icons.download,
                        color: ThemeColors.primaryText,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Descargar Pecs', style: ThemeTextStyle.robotoText),
                    ],
                  ),
                  selected: _selectedIndex == 1,
                  onTap: () {
                    _onItemTapped(1);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => SearchScreen(themeManager: _themeManager,),
                      ),
                    );
                  },
                ),

                 // Activities
                 ListTile(
                  title: Row(
                    children: [
                      const Icon(
                        Icons.view_column_outlined,
                        color: ThemeColors.primaryText,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Actividades Hoy', style: ThemeTextStyle.robotoText),
                    ],
                  ),
                  selected: _selectedIndex == 3,
                  onTap: () {
                    _onItemTapped(3);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const Activities(),
                      ),
                    );
                  },
                ),
                //Ajustes -> SettingsScreen
                // ListTile(
                //   title: Row(
                //     children: [
                //       const Icon(
                //         Icons.settings,
                //         color: ThemeColors.primaryText,
                //       ),
                //       const SizedBox(
                //         width: 10,
                //       ),
                //       Text('Ajustes', style: ThemeTextStyle.robotoText),
                //     ],
                //   ),
                //   selected: _selectedIndex == 2,
                //   onTap: () {
                //     _onItemTapped(2);
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (ctx) => SettingsScreen(themeManager: _themeManager,),
                //       ),
                //     );
                //   },
                // ),
                //Ajustes -> SettingsScreen
                ListTile(
                  title: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: ThemeColors.primaryText,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Acerca de', style: ThemeTextStyle.robotoText),
                    ],
                  ),
                  selected: _selectedIndex == 2,
                  onTap: () {
                    _onItemTapped(2);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) =>  AboutScreen(),
                      ),
                    );
                  },
                ),
                //Components -> DesignSystem
                // ListTile(
                //   title: Row(
                //     children: [
                //       const Icon(
                //         Icons.dashboard,
                //         color: ThemeColors.primaryText,
                //       ),
                //       const SizedBox(
                //         width: 10,
                //       ),
                //       Text('Componentes', style: ThemeTextStyle.robotoText),
                //     ],
                //   ),
                //   selected: _selectedIndex == 0,
                //   onTap: () {
                //     _onItemTapped(4);
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (ctx) => const DesignSystem(),
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
          ListTile(
            title: buildNumber,
          ),
        ],
      ),
    );
  }
}
