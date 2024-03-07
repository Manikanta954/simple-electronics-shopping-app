import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        canvasColor: Colors.white,
        cardColor: Colors.white,
        buttonTheme: ButtonThemeData(buttonColor: darkbluishColor),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          color: Color.fromARGB(255, 0, 0, 0),
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      cardColor: Colors.black,
      canvasColor: darkcreamcolor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      buttonTheme: ButtonThemeData(buttonColor: lightbluishcolor),
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0.0,

        iconTheme: IconThemeData(color: Colors.black),

        //  textTheme: Theme.of(context).textTheme,
      ));

  static Color creamcolor = const Color(0xfff5f5f5);
  static Color darkcreamcolor = Vx.gray900;
  static Color darkbluishColor = const Color(0xff403b58);
  static Color lightbluishcolor = Vx.indigo500;
}
