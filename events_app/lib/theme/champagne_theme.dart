import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChampagneThemeTokens extends ThemeExtension<ChampagneThemeTokens> {
  const ChampagneThemeTokens({
    required this.pearl,
    required this.champagne,
    required this.gold,
    required this.blush,
    required this.graphite,
    required this.secondaryText,
    required this.border,
    required this.goldTextOnPearl,
    required this.success,
    required this.warning,
    required this.danger,
    required this.buttonRadius,
    required this.inputRadius,
    required this.cardRadius,
    required this.progressPillRadius,
    required this.motionDuration,
    required this.instantDuration,
    required this.displayFontFamily,
    required this.bodyFontFamily,
    required this.dateVenueLetterSpacing,
    required this.dashboardProgress,
    required this.mastheadMaxWidth,
  });

  final Color pearl;
  final Color champagne;
  final Color gold;
  final Color blush;
  final Color graphite;
  final Color secondaryText;
  final Color border;
  final Color goldTextOnPearl;
  final Color success;
  final Color warning;
  final Color danger;

  final BorderRadius buttonRadius;
  final BorderRadius inputRadius;
  final BorderRadius cardRadius;
  final BorderRadius progressPillRadius;

  final Duration motionDuration;
  final Duration instantDuration;

  final String displayFontFamily;
  final String bodyFontFamily;

  final double dateVenueLetterSpacing;
  final double dashboardProgress;
  final double mastheadMaxWidth;

  static const ChampagneThemeTokens light = ChampagneThemeTokens(
    pearl: Color(0xFFFBF9F5),
    champagne: Color(0xFFEFE6D8),
    gold: Color(0xFFC0A062),
    blush: Color(0xFFD8B7A5),
    graphite: Color(0xFF2B2B2E),
    secondaryText: Color(0xFF7E7869),
    border: Color(0xFFE6E0D4),
    goldTextOnPearl: Color(0xFF8A6E35),
    success: Color(0xFF5B7A5E),
    warning: Color(0xFFA9762B),
    danger: Color(0xFFA04141),
    buttonRadius: BorderRadius.all(Radius.circular(4)),
    inputRadius: BorderRadius.all(Radius.circular(4)),
    cardRadius: BorderRadius.all(Radius.circular(12)),
    progressPillRadius: BorderRadius.all(Radius.circular(999)),
    motionDuration: Duration(milliseconds: 280),
    instantDuration: Duration.zero,
    displayFontFamily: 'Prata',
    bodyFontFamily: 'Jost',
    dateVenueLetterSpacing: 3,
    dashboardProgress: 0.62,
    mastheadMaxWidth: 340,
  );

  static const ChampagneThemeTokens dark = ChampagneThemeTokens(
    pearl: Color(0xFF1E1E21),
    champagne: Color(0xFF2A2822),
    gold: Color(0xFFC0A062),
    blush: Color(0xFFD8B7A5),
    graphite: Color(0xFFF2EFE8),
    secondaryText: Color(0xFFB5AFA2),
    border: Color(0xFFE6E0D4),
    goldTextOnPearl: Color(0xFFC0A062),
    success: Color(0xFF5B7A5E),
    warning: Color(0xFFA9762B),
    danger: Color(0xFFA04141),
    buttonRadius: BorderRadius.all(Radius.circular(4)),
    inputRadius: BorderRadius.all(Radius.circular(4)),
    cardRadius: BorderRadius.all(Radius.circular(12)),
    progressPillRadius: BorderRadius.all(Radius.circular(999)),
    motionDuration: Duration(milliseconds: 280),
    instantDuration: Duration.zero,
    displayFontFamily: 'Prata',
    bodyFontFamily: 'Jost',
    dateVenueLetterSpacing: 3,
    dashboardProgress: 0.62,
    mastheadMaxWidth: 340,
  );

  @override
  ChampagneThemeTokens copyWith({
    Color? pearl,
    Color? champagne,
    Color? gold,
    Color? blush,
    Color? graphite,
    Color? secondaryText,
    Color? border,
    Color? goldTextOnPearl,
    Color? success,
    Color? warning,
    Color? danger,
    BorderRadius? buttonRadius,
    BorderRadius? inputRadius,
    BorderRadius? cardRadius,
    BorderRadius? progressPillRadius,
    Duration? motionDuration,
    Duration? instantDuration,
    String? displayFontFamily,
    String? bodyFontFamily,
    double? dateVenueLetterSpacing,
    double? dashboardProgress,
    double? mastheadMaxWidth,
  }) {
    return ChampagneThemeTokens(
      pearl: pearl ?? this.pearl,
      champagne: champagne ?? this.champagne,
      gold: gold ?? this.gold,
      blush: blush ?? this.blush,
      graphite: graphite ?? this.graphite,
      secondaryText: secondaryText ?? this.secondaryText,
      border: border ?? this.border,
      goldTextOnPearl: goldTextOnPearl ?? this.goldTextOnPearl,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      buttonRadius: buttonRadius ?? this.buttonRadius,
      inputRadius: inputRadius ?? this.inputRadius,
      cardRadius: cardRadius ?? this.cardRadius,
      progressPillRadius: progressPillRadius ?? this.progressPillRadius,
      motionDuration: motionDuration ?? this.motionDuration,
      instantDuration: instantDuration ?? this.instantDuration,
      displayFontFamily: displayFontFamily ?? this.displayFontFamily,
      bodyFontFamily: bodyFontFamily ?? this.bodyFontFamily,
      dateVenueLetterSpacing:
          dateVenueLetterSpacing ?? this.dateVenueLetterSpacing,
      dashboardProgress: dashboardProgress ?? this.dashboardProgress,
      mastheadMaxWidth: mastheadMaxWidth ?? this.mastheadMaxWidth,
    );
  }

  @override
  ThemeExtension<ChampagneThemeTokens> lerp(
    covariant ThemeExtension<ChampagneThemeTokens>? other,
    double t,
  ) {
    if (other is! ChampagneThemeTokens) {
      return this;
    }

    return ChampagneThemeTokens(
      pearl: Color.lerp(pearl, other.pearl, t) ?? pearl,
      champagne: Color.lerp(champagne, other.champagne, t) ?? champagne,
      gold: Color.lerp(gold, other.gold, t) ?? gold,
      blush: Color.lerp(blush, other.blush, t) ?? blush,
      graphite: Color.lerp(graphite, other.graphite, t) ?? graphite,
      secondaryText:
          Color.lerp(secondaryText, other.secondaryText, t) ?? secondaryText,
      border: Color.lerp(border, other.border, t) ?? border,
      goldTextOnPearl: Color.lerp(goldTextOnPearl, other.goldTextOnPearl, t) ??
          goldTextOnPearl,
      success: Color.lerp(success, other.success, t) ?? success,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      danger: Color.lerp(danger, other.danger, t) ?? danger,
      buttonRadius: BorderRadius.lerp(buttonRadius, other.buttonRadius, t) ??
          buttonRadius,
      inputRadius:
          BorderRadius.lerp(inputRadius, other.inputRadius, t) ?? inputRadius,
      cardRadius:
          BorderRadius.lerp(cardRadius, other.cardRadius, t) ?? cardRadius,
      progressPillRadius:
          BorderRadius.lerp(progressPillRadius, other.progressPillRadius, t) ??
              progressPillRadius,
      motionDuration: t < 0.5 ? motionDuration : other.motionDuration,
      instantDuration: t < 0.5 ? instantDuration : other.instantDuration,
      displayFontFamily: t < 0.5 ? displayFontFamily : other.displayFontFamily,
      bodyFontFamily: t < 0.5 ? bodyFontFamily : other.bodyFontFamily,
      dateVenueLetterSpacing:
          t < 0.5 ? dateVenueLetterSpacing : other.dateVenueLetterSpacing,
      dashboardProgress: t < 0.5 ? dashboardProgress : other.dashboardProgress,
      mastheadMaxWidth: t < 0.5 ? mastheadMaxWidth : other.mastheadMaxWidth,
    );
  }
}

ThemeData buildChampagneTheme(Brightness brightness) {
  final tokens = brightness == Brightness.dark
      ? ChampagneThemeTokens.dark
      : ChampagneThemeTokens.light;

  final textTheme = GoogleFonts.jostTextTheme().copyWith(
    displayLarge: GoogleFonts.prata(color: tokens.graphite),
    displayMedium: GoogleFonts.prata(color: tokens.graphite),
    headlineLarge: GoogleFonts.prata(color: tokens.graphite),
    headlineMedium: GoogleFonts.prata(color: tokens.graphite),
    titleLarge: GoogleFonts.prata(color: tokens.graphite),
    bodyLarge: GoogleFonts.jost(color: tokens.graphite),
    bodyMedium: GoogleFonts.jost(color: tokens.graphite),
    bodySmall: GoogleFonts.jost(color: tokens.secondaryText),
    labelLarge: GoogleFonts.jost(color: tokens.graphite),
    labelMedium: GoogleFonts.jost(color: tokens.secondaryText),
  );

  final colorScheme = ColorScheme(
    brightness: brightness,
    primary: tokens.graphite,
    onPrimary: tokens.pearl,
    secondary: tokens.gold,
    onSecondary: tokens.graphite,
    error: tokens.danger,
    onError: tokens.pearl,
    surface: tokens.pearl,
    onSurface: tokens.graphite,
  );

  return ThemeData(
    brightness: brightness,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: tokens.pearl,
    textTheme: textTheme,
    useMaterial3: true,
    extensions: <ThemeExtension<dynamic>>[tokens],
    cardTheme: CardTheme(
      color: tokens.pearl,
      shape: RoundedRectangleBorder(
        borderRadius: tokens.cardRadius,
        side: BorderSide(color: tokens.border),
      ),
      elevation: 0,
      margin: EdgeInsets.zero,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: tokens.pearl,
      surfaceTintColor: tokens.pearl,
      foregroundColor: tokens.graphite,
      titleTextStyle: GoogleFonts.prata(
        color: tokens.graphite,
        fontSize: 26,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: tokens.champagne,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: tokens.inputRadius,
        borderSide: BorderSide(color: tokens.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: tokens.inputRadius,
        borderSide: BorderSide(color: tokens.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: tokens.inputRadius,
        borderSide: BorderSide(color: tokens.gold),
      ),
      labelStyle: GoogleFonts.jost(color: tokens.secondaryText),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: tokens.graphite,
      foregroundColor: tokens.pearl,
      shape: RoundedRectangleBorder(borderRadius: tokens.buttonRadius),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: tokens.graphite,
        foregroundColor: tokens.pearl,
        shape: RoundedRectangleBorder(borderRadius: tokens.buttonRadius),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: tokens.goldTextOnPearl,
        side: BorderSide(color: tokens.gold),
        shape: RoundedRectangleBorder(borderRadius: tokens.buttonRadius),
      ),
    ),
  );
}

extension ChampagneThemeContext on BuildContext {
  ChampagneThemeTokens get champagneTokens =>
      Theme.of(this).extension<ChampagneThemeTokens>()!;
}
