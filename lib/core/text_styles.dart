import 'package:abdullansr/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  // Display styles
  static TextStyle displayLarge(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 57,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
      height: 1.2,
    );
  }

  static TextStyle displayMedium(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 45,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.2,
    );
  }

  // Headline styles
  static TextStyle headlineLarge(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle headlineMedium(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle headlineSmall(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    );
  }

  // Title styles
  static TextStyle titleLarge(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    );
  }

  // Body styles
  static TextStyle bodyLarge(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
      height: 1.5,
    );
  }

  static TextStyle bodyMedium(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
      height: 1.5,
    );
  }

  static TextStyle bodySmall(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
    );
  }

  // Label styles
  static TextStyle labelLarge(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    );
  }

  // Button style
  static TextStyle button(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
  }
}
