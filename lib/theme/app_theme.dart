import 'package:flutter/material.dart';

// ── Colors ────────────────────────────────────────────────────────────────────
class AppColors {
  AppColors._();

  static const Color primary      = Color(0xFF1A3C5E);
  static const Color primaryDark  = Color(0xFF0D2137);
  static const Color accent       = Color(0xFF00C9A7);
  static const Color accentDark   = Color(0xFF009E86);
  static const Color background   = Color(0xFFF6F9FC);
  static const Color surface      = Colors.white;
  static const Color star         = Color(0xFFFFD700);
  static const Color error        = Color(0xFFE53935);
  static const Color textPrimary  = Color(0xFF1A3C5E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color border       = Color(0xFFE0E7EF);
  static const Color divider      = Color(0xFFE0E7EF);
}

// ── Spacing ───────────────────────────────────────────────────────────────────
class AppSpacing {
  AppSpacing._();

  static const double xs  = 4.0;
  static const double sm  = 8.0;
  static const double md  = 14.0;
  static const double lg  = 20.0;
  static const double xl  = 28.0;
  static const double xxl = 40.0;
}

// ── Border Radius ─────────────────────────────────────────────────────────────
class AppRadius {
  AppRadius._();

  static const double sm   = 10.0;
  static const double md   = 14.0;
  static const double lg   = 20.0;
  static const double xl   = 28.0;
  static const double pill = 999.0;
}

// ── Icon Sizes ────────────────────────────────────────────────────────────────
class AppIconSize {
  AppIconSize._();

  static const double sm = 14.0;
  static const double md = 20.0;
  static const double lg = 28.0;
}

// ── Text Styles ───────────────────────────────────────────────────────────────
class AppTextStyles {
  AppTextStyles._();

  static const TextStyle screenTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
  );

  static const TextStyle sectionTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle cardTitle = TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
  );

  static const TextStyle bodyText = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 15,
    height: 1.7,
  );

  static const TextStyle label = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
  );

  static const TextStyle infoValue = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle chip = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle price = TextStyle(
    color: Colors.white,
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle badge = TextStyle(
    color: Colors.white,
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
  );

  static const TextStyle button = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.5,
  );
}

// ── Gradients ─────────────────────────────────────────────────────────────────
class AppGradients {
  AppGradients._();

  static const LinearGradient header = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primary, AppColors.primaryDark],
  );

  static const LinearGradient button = LinearGradient(
    colors: [AppColors.accent, AppColors.accentDark],
  );

  static const LinearGradient priceCard = LinearGradient(
    colors: [AppColors.primary, Color(0xFF0D5C8C)],
  );

  static LinearGradient cardOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black.withOpacity(0.75)],
    stops: const [0.4, 1.0],
  );

  static LinearGradient heroOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.black.withOpacity(0.4),
      Colors.transparent,
      Colors.black.withOpacity(0.3),
    ],
  );
}

// ── Shadows ───────────────────────────────────────────────────────────────────
class AppShadows {
  AppShadows._();

  static List<BoxShadow> card = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      blurRadius: 15,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> surface = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> button = [
    BoxShadow(
      color: AppColors.accent.withOpacity(0.4),
      blurRadius: 12,
      offset: const Offset(0, 6),
    ),
  ];

  static List<BoxShadow> bottomBar = [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 20,
      offset: const Offset(0, -5),
    ),
  ];
}

// ── Theme Data ────────────────────────────────────────────────────────────────
class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.primary,
        secondary: AppColors.accent,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.primary),
        titleTextStyle: TextStyle(
          color: AppColors.primary,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Color(0xFFBBBBBB),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 11),
      ),
    );
  }
}