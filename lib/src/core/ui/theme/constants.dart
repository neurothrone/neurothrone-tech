import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF9F00FF); // Vivid Violet
const Color kSurfaceDarkColor = Color(0xFF1E1E1E);
const Color kBackgroundDarkColor = Color(0xFF121212);
const Color kPanelDarkColor = Color(0xFF1A1A1A);
const Color kLightPurpleColor = Color(0xFFB388FF);
const Color kHoverBackgroundColor = Color(
  0xFF2A2A2A,
); // Slight contrast for hover
const Color kDividerBorderColor = Color(0xFF2A2A2A);

const kDividerBorderSide = BorderSide(color: kDividerBorderColor, width: 1);

const LinearGradient kVioletGradient = LinearGradient(
  colors: [
    Color(0xFF8E2DE2), // deep violet
    kPrimaryColor, // vivid violet
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
