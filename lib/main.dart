import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radio/screens/EntryPoint.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        sliderTheme: SliderThemeData(trackHeight: 1.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Color(0XFFFF296D),
        accentColor: Color(0XFF005679),
        backgroundColor: Color(0xFFF01012A),
        buttonColor: Color(0XFFFF296D),
        canvasColor: Color(0xFF05D8E8),
        textTheme: TextTheme(
          caption: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.white.withOpacity(0.3),
              fontFamily: GoogleFonts.sourceSansPro().fontFamily),
          button: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: GoogleFonts.sourceSansPro().fontFamily),
          bodyText1: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: GoogleFonts.sourceSansPro().fontFamily),
          bodyText2: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: GoogleFonts.sourceSansPro().fontFamily),
          headline1: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontFamily: GoogleFonts.sourceSansPro().fontFamily),
          headline2: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontFamily: GoogleFonts.sourceSansPro().fontFamily),
          headline3: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontFamily: GoogleFonts.sourceSansPro().fontFamily),
        ),
      ),
      home: EntryPoint(),
    );
  }
}
