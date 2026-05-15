import 'package:flutter/material.dart';

class AppColors {
  // Deep cinematic backgrounds
  static const Color background = Color(0xFF030014); // Very dark, deep violet/blue
  static const Color surface = Color(0xFF0A0427); // Dark purple surface
  static const Color surfaceHighlight = Color(0xFF140B40);
  
  // Text
  static const Color textPrimary = Color(0xFFFAFAFA);
  static const Color textSecondary = Color(0xFFA1A1AA); // Keeping a cool grey
  
  // Neon Accents
  static const Color accentPrimary = Color(0xFF4D4DFF); // Bright neon blue/purple
  static const Color accentSecondary = Color(0xFFB533FF); // Bright neon purple
  static const Color accentTertiary = Color(0xFF00FFCC); // Cyan/Teal neon for highlights
  
  // Glassmorphism borders and fills
  static const Color border = Color(0x33FFFFFF); // 20% white for crisp glass borders
  static const Color glassBackground = Color(0x0AFFFFFF); // Very subtle white fill
  static const Color glassBorder = Color(0x1AFFFFFF); // 10% white border
  
  static const Color glassGlow = Color(0x404D4DFF); // Glowing shadow base
}

class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;
  static const double section = 120.0;
}

class AppRadius {
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;
}

class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
}
