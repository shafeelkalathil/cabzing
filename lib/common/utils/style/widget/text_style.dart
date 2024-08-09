import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle customTextStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.poppins(
    color: color ?? Colors.white,  // Default color
    fontSize: fontSize ?? 16,      // Default font size
    fontWeight: fontWeight ?? FontWeight.normal,  // Default font weight
  );
}