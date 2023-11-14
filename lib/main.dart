// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:app/pages/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  runApp(const AgendaPecsApp());
}

class AgendaPecsApp extends StatelessWidget {
  const AgendaPecsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda PECS',
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              headlineLarge: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                
              ),
              headlineMedium: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                
              ),
              headlineSmall: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                
              ),
              titleLarge: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
              titleMedium: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 14,
              ),
              titleSmall: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 12,
              ),
              bodyLarge: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                
                color: kColorScheme.onSecondaryContainer,
                
              ),
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      home: const DesignSystem(),
    );
  }
}
