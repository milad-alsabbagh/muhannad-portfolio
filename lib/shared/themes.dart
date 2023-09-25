import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/shared/constants.dart';

ThemeData lightTheme=ThemeData(
  scaffoldBackgroundColor: lightBackGroundColor,
    textTheme:TextTheme(
      titleLarge: GoogleFonts.sirinStencil(
          color: textLightColor,
        fontSize: 32,
      ),
      labelMedium:GoogleFonts.sirinStencil(
        color: Colors.blue,
        fontSize: 24,
      ),
    ),
);





ThemeData darkTheme =ThemeData(
  scaffoldBackgroundColor: darkBackGroundColor,
  textTheme:  TextTheme(
    titleLarge: GoogleFonts.sirinStencil(
     color: Colors.white,
      fontSize: 32,
    ),
    labelMedium:GoogleFonts.sirinStencil(
      color: Colors.blue,
      fontSize: 24,
    ),
  ),
);
//title large for name and greeting message
//label medium for navigator pages textButtons