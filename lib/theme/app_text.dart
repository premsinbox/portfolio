import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Typography hierarchy per the design system:
/// - Outfit: ultra-bold display/headings, tight negative letter-spacing.
/// - Plus Jakarta Sans: body copy and subtitles, neutral and legible.
/// - JetBrains Mono: badges, tags, metadata — uppercase, wide tracking.
class AppText {
  AppText._();

  static TextStyle display({
    double size = 48,
    Color color = AppColors.textPrimaryLight,
    FontWeight weight = FontWeight.w800,
    double? height,
    double letterSpacing = -1.0,
  }) {
    return GoogleFonts.outfit(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle body({
    double size = 16,
    Color color = AppColors.textSecondaryLight,
    FontWeight weight = FontWeight.w500,
    double height = 1.65,
  }) {
    return GoogleFonts.plusJakartaSans(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
    );
  }

  /// Renders as UPPERCASE by convention — pass plain-case text and it will
  /// be visually tracked-out; callers should also apply .toUpperCase() to
  /// the string itself so it reads correctly without relying on CSS-only
  /// text-transform (Flutter has no text-transform primitive).
  static TextStyle mono({
    double size = 11,
    Color color = AppColors.textMuted,
    FontWeight weight = FontWeight.w700,
    double letterSpacing = 1.0,
  }) {
    return GoogleFonts.jetBrainsMono(
      fontSize: size,
      fontWeight: weight,
      color: color,
      letterSpacing: letterSpacing,
    );
  }
}
