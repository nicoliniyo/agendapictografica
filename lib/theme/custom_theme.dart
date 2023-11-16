import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

 TextStyle myHeadline1 = GoogleFonts.notoSerif(
  textStyle: const TextStyle(
    // ignore: avoid_redundant_argument_values
    inherit: true,
    //color: myColorSchemes.onSurface,
    //backgroundColor: myColorSchemes.background,
    fontSize: 96,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    letterSpacing: -1.5,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
    debugLabel: 'Headline1',
    overflow: TextOverflow.fade,
  ),
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  primaryColor: ThemeColors.primary,

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ThemeColors.accentColor,  ),
  
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
      backgroundColor: MaterialStateProperty.all<Color>(ThemeColors.primary),
    )),
  
  textTheme: const TextTheme(
    
    headlineLarge: TextStyle(
      fontFamily: 'Anton',
        // ignore: avoid_redundant_argument_values
        inherit: true,
        //color: myColorSchemes.onSurface,
        //backgroundColor: myColorSchemes.background,
        fontSize: 96,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        letterSpacing: -1.5,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        debugLabel: 'Headline1',
        overflow: TextOverflow.fade,
      ),

    // headlineLarge: TextStyle(
      
    //             fontFamily: 'Anton',
    //             fontWeight: FontWeight.normal,
    //             color: Color.fromARGB(255, 107, 3, 244),
                
    //           ),
              headlineMedium: TextStyle(
                // fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.normal,
                color: ThemeColors.primary
                
              ),
              headlineSmall: TextStyle(
                // fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.normal,
                color: ThemeColors.primary
                
              ),
              titleLarge: TextStyle(
                // fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.normal,
                color: ThemeColors.primary
                // fontSize: 16,
              ),
              titleMedium: TextStyle(
                // fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.normal,
                color: ThemeColors.primary,
                fontSize: 14,
              ),
              titleSmall: TextStyle(
                // fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.normal,
                color: ThemeColors.primary,
                fontSize: 12,
              ),
              bodyLarge: TextStyle(
                // fontFamily: GoogleFonts.roboto().fontFamily,
                
                color: ThemeColors.primary
                
              ),
  ),
  // appBarTheme: const AppBarTheme(
  //   color: Color.fromARGB(255, 228, 229, 230),
  //   iconTheme: IconThemeData(color: Color.fromARGB(255, 100, 99, 99)),
  // ),
  // colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 4, 91, 161)),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
      backgroundColor: MaterialStateProperty.all<Color>(ThemeColors.accentColor),
    )),
  // textTheme: const TextTheme(
  //   displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
  //   bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
  // ),
  // appBarTheme: const AppBarTheme(
  //   color: Color.fromARGB(255, 228, 229, 230),
  //   iconTheme: IconThemeData(color: Color.fromARGB(255, 100, 99, 99)),
  // ),
  // colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 4, 91, 161)),
);

class ThemeColors {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color defaultColor = Color.fromRGBO(136, 136, 136, 1.0);
  static const Color primaryDark = Color.fromRGBO(2, 136, 209, 1.0);
  static const Color primaryLigth = Color.fromRGBO(179, 229, 252, 1.0);
  static const Color primary = Color.fromRGBO(3, 169, 244, 1.0);
  static const Color icons = Color.fromRGBO(44, 44, 44, 1.0);
  static const Color accentColor = Color.fromRGBO(254, 36, 114, 1.0);
  static const Color primaryText = Color.fromRGBO(33, 33, 33, 1.0);
  static const Color secondaryText = Color.fromRGBO(117, 117, 117, 1.0);
  static const Color divider = Color.fromRGBO(189, 189, 189, 1.0);
  static const Color info = Color.fromRGBO(44, 168, 255, 1.0);
  static const Color error = Color.fromRGBO(206, 4, 4, 1.0);
  static const Color success = Color.fromRGBO(24, 206, 15, 1.0);
  static const Color warning = Color.fromRGBO(255, 178, 54, 1.0);
  static const Color disabled = Color.fromRGBO(136, 152, 170, 1.0);
  static const Color gradientStart = Color.fromRGBO(2, 84, 129, 1.0);
  static const Color gradientEnd = Color.fromRGBO(3, 169, 244, 1.0);
}

class ThemeTextStyle {
  static TextStyle robotoWhiteText =
      GoogleFonts.roboto(textStyle: const TextStyle(color: ThemeColors.white));

  static TextStyle robotoWhite16Text = GoogleFonts.roboto(
      textStyle: const TextStyle(
    color: ThemeColors.white,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  ));

  static TextStyle robotoText =
      GoogleFonts.roboto(textStyle: const TextStyle(color: ThemeColors.black));

  static TextStyle robotoBold16Text = GoogleFonts.roboto(
      textStyle: const TextStyle(
    color: ThemeColors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ));

  static TextStyle roboto10Text = GoogleFonts.roboto(
      textStyle: const TextStyle(
    color: ThemeColors.secondaryText,
    fontSize: 10,
    fontWeight: FontWeight.normal,
  ));

  static TextStyle roboto10WhiteText = GoogleFonts.roboto(
      textStyle: const TextStyle(
    color: ThemeColors.white,
    fontSize: 10,
    fontWeight: FontWeight.normal,
  ));
}
