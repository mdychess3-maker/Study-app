import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const Color background = Color(0xFF0A0B0C);
  static const Color backgroundElevated = Color(0xFF101214);
  static const Color surface = Color(0xFF141719);
  static const Color surfaceLight = Color(0xFF1A1D20);
  static const Color surfaceLighter = Color(0xFF25292D);
  static const Color glassHighlight = Color(0x12FFFFFF);
  static const Color glassEdge = Color(0x1FFFFFFF);

  static const Color primary = Color(0xFFE8E1D7);
  static const Color primaryDark = Color(0xFFBEB5A8);
  static const Color primaryLight = Color(0xFFF7F2EA);
  static const Color reward = Color(0xFFFF9D43);
  static const Color rewardDeep = Color(0xFFD97724);
  static const Color mint = Color(0xFFA9D8CB);
  static const Color blue = Color(0xFFAFC7E8);
  static const Color lilac = Color(0xFFC9C0E8);

  static const Color textPrimary = Color(0xFFF3EFE8);
  static const Color textSecondary = Color(0xFFA3A7AA);
  static const Color textTertiary = Color(0xFF6D7378);

  static const Color divider = Color(0x1FFFFFFF);
  static const Color error = Color(0xFFFF8175);
  static const Color success = Color(0xFFA9D8CB);

  static const BorderRadius cardRadius =
      BorderRadius.all(Radius.circular(24));

  static const BorderRadius smallRadius =
      BorderRadius.all(Radius.circular(16));

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: const ColorScheme.dark(
          primary: primary,
          secondary: mint,
          surface: surface,
          onSurface: textPrimary,
          error: error,
          onError: background,
        ),
        splashFactory: InkRipple.splashFactory,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: textPrimary,
            letterSpacing: -0.7,
          ),
          iconTheme: IconThemeData(color: textPrimary),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: background,
            systemNavigationBarIconBrightness:
                Brightness.light,
          ),
        ),
        cardTheme: const CardTheme(
          color: surfaceLight,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: cardRadius,
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: divider,
          thickness: 1,
        ),
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: textPrimary,
            letterSpacing: -1.2,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: textPrimary,
            letterSpacing: -0.6,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: textPrimary,
            height: 1.35,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: textSecondary,
            height: 1.35,
          ),
          labelLarge: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: textPrimary,
            letterSpacing: 0.1,
          ),
        ),
      );
}