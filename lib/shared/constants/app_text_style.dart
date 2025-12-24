import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle heading({
    FontWeight fontWeight = FontWeight.w500,
    double fontSize = 20,
    Color color = Colors.black,
    TextOverflow overflow = TextOverflow.ellipsis,
    bool underline = false,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      overflow: overflow,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      decorationColor: color,
    );
  }

  static TextStyle body({
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 14,
    Color color = Colors.black,
    TextOverflow overflow = TextOverflow.ellipsis,
    bool underline = false,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      overflow: overflow,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      decorationColor: color,
    );
  }

  /// Sans – OpenSans
  static TextStyle openSans({
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 14,
    Color color = Colors.black,
    TextOverflow overflow = TextOverflow.ellipsis,
    bool underline = false,
  }) {
    return GoogleFonts.openSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      decorationColor: color,
    );
  }

  /// Abel
  static TextStyle abel({
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 14,
    Color color = Colors.black,
    TextOverflow overflow = TextOverflow.ellipsis,
    bool underline = false,
  }) {
    return GoogleFonts.abel(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      decorationColor: color,
    );
  }
}
