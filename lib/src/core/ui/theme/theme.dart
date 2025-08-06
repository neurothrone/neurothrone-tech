import 'package:flutter/material.dart';

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
    background: backgroundDark,
    surface: surfaceDark,
    onPrimary: Colors.white,
    onSecondary: Colors.white70,
    onSurface: Colors.white,
    onBackground: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: panelDark,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    shape: Border(bottom: borderDividerStyle),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: panelDark,
  ),
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: panelDark,
    selectedIconTheme: const IconThemeData(color: primaryColor),
    selectedLabelTextStyle: const TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w400,
    ),
    unselectedIconTheme: IconThemeData(color: Colors.white.withOpacity(0.6)),
    unselectedLabelTextStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
    indicatorColor: primaryColor.withOpacity(0.2),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white.withOpacity(0.87)),
    bodyMedium: TextStyle(color: Colors.white.withOpacity(0.65)),
    labelLarge: const TextStyle(fontWeight: FontWeight.w500),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xFF7A00CC); // darker vivid violet
        }
        return null; // fallback to gradient layer
      }),
      elevation: MaterialStateProperty.all(0),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      overlayColor: MaterialStateProperty.all(Colors.white12),
    ),
  ),
  listTileTheme: ListTileThemeData(
    selectedColor: primaryColor,
    selectedTileColor: const Color(0xFF2A2A2A),
    iconColor: Colors.white70,
    textColor: Colors.white70,
  ),
  dividerTheme: DividerThemeData(
    color: borderDivider,
    thickness: 1,
    space: 0,
  ),
);
