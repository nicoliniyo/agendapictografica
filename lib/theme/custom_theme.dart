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
MaterialColor myGreen = const MaterialColor(0xFCE4EC400,
       {
        50 :  Color(0xFFAAD401),
        100 : const Color(0xFFAAD403),
        200 : const Color(0xFFAAD406),
        300 : const Color(0xFFAAD409),
        400 : const Color(0xFFAAD40C),
        500 : const Color(0xFFAAD40F),
        600 : const Color(0xFFAAD412),
        700 : const Color(0xFFAAD415),
        800 : const Color(0xFFAAD418),
        900 : const Color(0xFFAAD41F)});
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 3, 169, 244),
);

var kColorSchemeDark = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 7, 85, 122),
);

ThemeData theTheme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kColorScheme
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: kColorScheme,
  primaryColor: ThemeColors.accentColor,
  splashColor: ThemeColors.accentColor,
  primarySwatch: myGreen,
  hintColor: ThemeColors.accentColor,
  canvasColor: ThemeColors.accentColor,
  backgroundColor: ThemeColors.accentColor,
  bottomAppBarColor: ThemeColors.accentColor,

  cardTheme: const CardTheme().copyWith(
    color: kColorScheme.primaryContainer,
    margin: const EdgeInsets.symmetric(
      // horizontal: 16,
      // vertical: 8,
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ThemeColors.accentColor,  ),
  
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        )
      ),
      elevation: MaterialStateProperty.all(1),
      backgroundColor: MaterialStateProperty.all<Color>(ThemeColors.white),
    )),

  outlinedButtonTheme: OutlinedButtonThemeData(
    // style: OutlinedButton.styleFrom(
    //     primary: ThemeColors.accentColor,
    //     backgroundColor: ThemeColors.white,
    //     foregroundColor: ThemeColors.accentColor,
    //     ),
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0)
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            side:
            const BorderSide(
                color: ThemeColors.accentColor,
                width: 20,
                style: BorderStyle.solid),
          )
      ),
      elevation: MaterialStateProperty.all(1),
      // backgroundColor: MaterialStateProperty.all<Color>(ThemeColors.white),
      foregroundColor: MaterialStateProperty.all<Color>(ThemeColors.black),
    ),

  ),

  textTheme: const TextTheme(
    
    headlineLarge: TextStyle(
      //fontFamily: 'Anton',
        // ignore: avoid_redundant_argument_values
        inherit: true,
        //color: myColorSchemes.onSurface,
        //backgroundColor: myColorSchemes.background,
        // fontSize: 20,
        //fontWeight: FontWeight.w300,
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
                //color: ThemeColors.primary
                
              ),
              headlineSmall: TextStyle(
                // fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.normal,
                //color: ThemeColors.primary
                
              ),
              titleLarge: TextStyle(
                // fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.normal,
                //color: ThemeColors.primary
                // fontSize: 16,
              ),
              titleMedium: TextStyle(
                // fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.normal,
                //color: ThemeColors.primary,
                //fontSize: 14,
              ),
              titleSmall: TextStyle(
                // fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.normal,
                //color: ThemeColors.primary,
                //fontSize: 12,
              ),
              bodyLarge: TextStyle(
                // fontFamily: GoogleFonts.roboto().fontFamily,
                
                //color: ThemeColors.primary
                
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
  outlinedButtonTheme: OutlinedButtonThemeData(
    // style: OutlinedButton.styleFrom(
    //     primary: ThemeColors.accentColor,
    //     backgroundColor: ThemeColors.white,
    //     foregroundColor: ThemeColors.accentColor,
    //     ),
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0)
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side:
            const BorderSide(
                color: ThemeColors.accentColor,
                width: 20,
                style: BorderStyle.solid),
          )
      ),
      overlayColor: MaterialStateProperty.all<Color>(ThemeColors.accentColor),
      surfaceTintColor: MaterialStateProperty.all<Color>(ThemeColors.accentColor),
      elevation: MaterialStateProperty.all(1),
      backgroundColor: MaterialStateProperty.all<Color>(ThemeColors.accentColor),
      // foregroundColor: MaterialStateProperty.all<Color>(ThemeColors.black),
    ),

  ),
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
