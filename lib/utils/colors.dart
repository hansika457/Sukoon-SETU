import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors (cool blue theme)
  static const Color primary = Color(0xFF9accff);        // Main blue
  static const Color primaryDark = Color(0xFF4A90E2);     // Darker shade of blue
  static const Color primaryLight = Color(0xFFD6EBFF);    // Lighter blue

  // Light Theme
  static const Color lightBackground = Color(0xFFF2F9FF); // Soft blue background
  static const Color lightSurface = Colors.white;         // Clean white cards
  static const Color lightTextPrimary = Color(0xFF1C1C1C); // Dark grey for contrast
  static const Color lightTextSecondary = Color(0xFF5A5A5A); // Medium grey

  // Dark Theme
  static const Color darkBackground = Color(0xFF0D1B2A); // Deep blue-black
  static const Color darkSurface = Color(0xFF1B263B);    // Slate blue surface
  static const Color darkTextPrimary = Colors.white;
  static const Color darkTextSecondary = Color(0xFFB0C4DE); // Light steel blue

  // Status Colors (still harmonized but distinct)
  static const Color error = Color(0xFFEF5350);           // Soft red
  static const Color success = Color(0xFF66BB6A);         // Balanced green
}
