import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF9F00FF); // Vivid Violet
const Color surfaceDark = Color(0xFF1E1E1E);
const Color backgroundDark = Color(0xFF121212);
const Color panelDark = Color(0xFF1A1A1A);
const Color lightPurple = Color(0xFFB388FF);
const Color hoverBackground = Color(0xFF2A2A2A); // Slight contrast for hover
const Color borderDivider = Color(0xFF2A2A2A);

const borderDividerStyle = BorderSide(color: borderDivider, width: 1);

const LinearGradient violetGradient = LinearGradient(
  colors: [
    Color(0xFF8E2DE2), // deep violet
    primaryColor, // vivid violet
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: backgroundDark,
  // base background
  canvasColor: panelDark,
  // drawer/nav rail background
  dividerColor: borderDivider,
  primaryColor: primaryColor,
  // Deep Purple
  colorScheme: ColorScheme.dark(
    // Violet/Indigo Accent
    primary: primaryColor,
    // Lighter complementary
    secondary: lightPurple,
    // 'background' is deprecated and shouldn't be used. Use surface instead.
    // background: backgroundDark,
    surface: surfaceDark,
    onPrimary: Colors.white,
    onSecondary: Colors.white70,
    onSurface: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: panelDark,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: GoogleFonts.orbitron(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    shape: const Border(bottom: borderDividerStyle),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: panelDark,
  ),
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: panelDark,
    selectedIconTheme: const IconThemeData(color: primaryColor),
    unselectedIconTheme: IconThemeData(
      color: Colors.white.withValues(alpha: 0.6),
    ),
    selectedLabelTextStyle: GoogleFonts.orbitron(
      color: primaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    unselectedLabelTextStyle: GoogleFonts.orbitron(
      color: Colors.white.withValues(alpha: 0.65),
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    indicatorColor: primaryColor.withValues(alpha: 0.2),
  ),
  textTheme: ThemeData.dark().textTheme.copyWith(
    displayLarge: GoogleFonts.orbitron(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.orbitron(
      color: Colors.white,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: GoogleFonts.orbitron(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: GoogleFonts.orbitron(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.orbitron(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: GoogleFonts.orbitron(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: const TextStyle(
      fontFamily: "CascadiaCode",
      color: Colors.white,
      fontSize: 16,
    ),
    bodyMedium: const TextStyle(
      fontFamily: "CascadiaCode",
      color: Colors.white70,
      fontSize: 14,
    ),
    bodySmall: const TextStyle(
      fontFamily: "CascadiaCode",
      color: Colors.white54,
      fontSize: 12,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return const Color(0xFF7A00CC); // darker vivid violet
        }
        return null; // fallback to gradient layer
      }),
      elevation: WidgetStateProperty.all(0),
      shadowColor: WidgetStateProperty.all(Colors.transparent),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      overlayColor: WidgetStateProperty.all(Colors.white12),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.white70),
      overlayColor: WidgetStateProperty.all(
        primaryColor.withValues(alpha: 0.2),
      ),
      // padding: WidgetStateProperty.all(
      //   const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // ),
      // shape: WidgetStateProperty.all(
      //   RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      // ),
    ),
  ),
  listTileTheme: ListTileThemeData(
    selectedColor: primaryColor,
    selectedTileColor: const Color(0xFF2A2A2A),
    iconColor: Colors.white70,
    textColor: Colors.white70,
    titleTextStyle: GoogleFonts.orbitron(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    subtitleTextStyle: const TextStyle(
      fontFamily: "CascadiaCode",
      color: Colors.white70,
      fontSize: 14,
      overflow: TextOverflow.ellipsis,
    ),
  ),
  dividerTheme: DividerThemeData(
    color: borderDivider,
    thickness: 1,
    space: 0,
  ),
);
