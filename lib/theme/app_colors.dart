import 'package:flutter/material.dart';

/// Strict monochrome architecture — no saturated accent colors anywhere.
/// All emphasis is carried by contrast, weight, and spacing only.
class AppColors {
  AppColors._();

  // Backgrounds
  static const Color deepBg = Color(0xFF0A0A0A); // pure dark carbon
  static const Color darkCardStart = Color(0xFF141414);
  static const Color darkCardEnd = Color(0xFF191919);
  static const Color lightBg = Color(0xFFFFFFFF);
  static const Color tintBg = Color(0xFFF7F7F8);

  // Text
  static const Color textPrimaryLight = Color(0xFF0A0A0A);
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryLight = Color(0xFF525252);
  static const Color textSecondaryDark = Color(0xFFD4D4D8);
  static const Color textMuted = Color(0xFF737373);
  static const Color textMutedDark = Color(0xFF9A9A9E);

  // Borders
  static const Color borderLight = Color(0xFFE5E5E5);
  static const Color borderDark = Color(0xFF262626);
  static final Color borderDarkAlpha = Colors.white.withOpacity(0.12);

  // Chips
  static const Color chipBgLight = Color(0xFFF4F4F5);

  // Nav
  static final Color navBg = const Color(0xFF0A0A0A).withOpacity(0.88);

  // Shadows
  static final Color hoverShadow = Colors.black.withOpacity(0.08);
}
