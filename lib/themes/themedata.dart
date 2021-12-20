// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: backGround,
  primaryColor: Colors.black,
  colorScheme: ColorScheme.dark(),
  iconTheme: IconThemeData(color: whiteColor, opacity: 0.9),
  textTheme: TextTheme(
      bodyText1: GoogleFonts.montserrat(
    color: whiteColor,
  )),
);

Color backGround = Color(0xFF17082A);
Color containerColor = Color(0xFF210F37);
Color whiteColor = Color(0xFFFFFFFF);
