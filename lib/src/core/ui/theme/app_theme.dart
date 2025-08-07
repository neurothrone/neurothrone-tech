import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: kBackgroundDarkColor,
  // base background
  canvasColor: kPanelDarkColor,
  // drawer/nav rail background
  dividerColor: kDividerBorderColor,
  primaryColor: kPrimaryColor,
  // Deep Purple
  colorScheme: ColorScheme.dark(
    // Violet/Indigo Accent
    primary: kPrimaryColor,
    // Lighter complementary
    secondary: kLightPurpleColor,
    // 'background' is deprecated and shouldn't be used. Use surface instead.
    // background: backgroundDark,
    surface: kSurfaceDarkColor,
    onPrimary: Colors.white,
    onSecondary: Colors.white70,
    onSurface: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: kPanelDarkColor,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: GoogleFonts.orbitron(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    shape: const Border(bottom: kDividerBorderSide),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: kPanelDarkColor,
  ),
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: kPanelDarkColor,
    selectedIconTheme: const IconThemeData(color: kPrimaryColor),
    unselectedIconTheme: IconThemeData(
      color: Colors.white.withValues(alpha: 0.6),
    ),
    selectedLabelTextStyle: GoogleFonts.orbitron(
      color: kPrimaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    unselectedLabelTextStyle: GoogleFonts.orbitron(
      color: Colors.white.withValues(alpha: 0.65),
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    indicatorColor: kPrimaryColor.withValues(alpha: 0.2),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: kPanelDarkColor,
    selectedItemColor: kPrimaryColor,
    unselectedItemColor: Colors.white.withValues(alpha: 0.65),
    selectedLabelStyle: GoogleFonts.orbitron(
      color: kPrimaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    unselectedLabelStyle: GoogleFonts.orbitron(
      color: Colors.white.withValues(alpha: 0.65),
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: kPanelDarkColor,
    indicatorColor: kPrimaryColor.withValues(alpha: 0.2),
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return GoogleFonts.orbitron(
          color: kPrimaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        );
      }
      return GoogleFonts.orbitron(
        color: Colors.white.withValues(alpha: 0.65),
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
    }),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const IconThemeData(color: kPrimaryColor);
      }
      return IconThemeData(
        color: Colors.white.withValues(alpha: 0.6),
      );
    }),
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
  // Button themes
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
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.white70),
      overlayColor: WidgetStateProperty.all(
        kPrimaryColor.withValues(alpha: 0.2),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.white70),
      overlayColor: WidgetStateProperty.all(
        kPrimaryColor.withValues(alpha: 0.2),
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
    selectedColor: kPrimaryColor,
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
    color: kDividerBorderColor,
    thickness: 1,
    space: 0,
  ),
);
