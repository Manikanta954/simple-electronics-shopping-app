import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Payement extends StatefulWidget {
  const Payement({super.key});

  @override
  State<Payement> createState() => _PayementState();
}

class _PayementState extends State<Payement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(
        'Yet to create payment option',
        style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      )),
    );
  }
}
