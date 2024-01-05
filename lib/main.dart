import 'dart:io';

import 'package:app/screens/search.dart';
import 'package:app/theme/custom_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.
void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 161, 174, 189),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 4, 93, 196),
);

void main() {
  _enablePlatformOverrideForDesktop();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
  runApp(const ProviderScope( child: AgendaPecsApp()));
  });
}

class AgendaPecsApp extends StatefulWidget {
  const AgendaPecsApp({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _AgendaPecsApp createState() => _AgendaPecsApp();

}

class _AgendaPecsApp extends State<AgendaPecsApp> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  themeListener() {
    if(mounted) {
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda PECS',
      
      themeMode: ThemeMode.light,

      theme: lightTheme,
      darkTheme: darkTheme,
      home: const SearchScreen(),
    );
  }
}
