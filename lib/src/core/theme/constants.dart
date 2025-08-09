import 'package:flutter/material.dart';

// const Color kPrimaryColor = Color(0xFFA259FF); // Highlight Purple
const Color kPrimaryColor = Color(0xFF9966FF); // Amethyst
const Color kPrimaryColorLight = Color(0xFFB388FF);
const Color kSurfaceDarkColor = Color(0xFF1E1E1E);
const Color kBackgroundDarkColor = Color(0xFF121212);
const Color kPanelDarkColor = Color(0xFF1A1A1A);
const Color kHoverBackgroundColor = Color(
  0xFF2A2A2A, // Slight contrast for hover
);
const Color kDividerBorderColor = Color(0xFF2A2A2A);

const LinearGradient kPrimaryGradient = LinearGradient(
  colors: [
    // Color(0xFF8E2DE2), // deep violet
    Color(0xFF7B2CBF), // mid-deep violet
    kPrimaryColor,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const kBorderSide = BorderSide(color: kDividerBorderColor, width: 1);
