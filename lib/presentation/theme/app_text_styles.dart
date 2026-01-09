import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Roboto
  static TextStyle robotoBlack({
    required double size,
    required Color color,
    FontStyle? fontStyle = FontStyle.normal,
    double lineHeight = 20,
    double letterSpacing = 0.25,

  }) => GoogleFonts.roboto(
    fontWeight: FontWeight.w900,
    color: color,
    fontSize: size,
    fontStyle: fontStyle,
    height: lineHeight / size,
    letterSpacing: letterSpacing,
  );

  static TextStyle robotoSemiBold({
    required double size,
    required Color color,
    FontStyle? fontStyle = FontStyle.normal,
    double lineHeight = 20,
    double letterSpacing = 0.25,

  }) => GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    color: color,
    fontSize: size,
    fontStyle: fontStyle,
    height: lineHeight / size,
    letterSpacing: letterSpacing,
  );

  static TextStyle robotoMedium({
    required double size,
    required Color color,
    FontStyle? fontStyle = FontStyle.normal,
    double lineHeight = 20,
    double letterSpacing = 0.25,

  }) => GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    color: color,
    fontSize: size,
    fontStyle: fontStyle,
    height: lineHeight / size,
    letterSpacing: letterSpacing,
  );

  static TextStyle robotoRegular({
    required double size,
    required Color color,
    FontStyle? fontStyle = FontStyle.normal,
    double lineHeight = 20,
    double letterSpacing = 0.25,

  }) => GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    color: color,
    fontSize: size,
    fontStyle: fontStyle,
    height: lineHeight / size,
    letterSpacing: letterSpacing,
  );

  // Inter
  static TextStyle interBold({
    required double size,
    required Color color,
    FontStyle? fontStyle = FontStyle.normal,
    double lineHeight = 20,
    double letterSpacing = 0.25,

  }) => GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    color: color,
    fontSize: size,
    fontStyle: fontStyle,
    height: lineHeight / size,
    letterSpacing: letterSpacing,
  );
}