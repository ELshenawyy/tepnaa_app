import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static const TextStyle headerTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.surface,
  );

  static const TextStyle headerSubtitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
  );
  static const TextStyle heading = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  );

  static const TextStyle subheading = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle label = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle loginTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 28,
    fontWeight: FontWeight.w900,
    color: AppColors.surface,
    height: 1.3,
  );

  static const TextStyle button = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w800,
    color: AppColors.surface,
  );

  static const TextStyle link = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );

  static const TextStyle hint = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.hint,
  );

  static const TextStyle errorText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.error,
  );

  static const TextStyle fieldLabel = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  static final TextStyle tagline = TextStyle(
    fontFamily: 'inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.tagline,
  );

  static final TextStyle loading = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.loading,
  );
  static const TextStyle skipButton = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    color: AppColors.surface,
  );

  static const TextStyle onboardingTag = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    color: Color(0xB3FFFFFF),
  );

  static const TextStyle onboardingTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 28,
    fontWeight: FontWeight.w900,
    color: AppColors.surface,
    height: 1.3,
  );

  static const TextStyle selsectlangTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColors.primary,
  );
  static const TextStyle languageName = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle languageSubName = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
  static const TextStyle tabLabelActive = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

  static const TextStyle tabLabelInactive = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static const TextStyle vipButton = TextStyle(
    fontFamily: 'Inter',
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: AppColors.surface,
  );
  static const TextStyle vipText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 9,
    fontWeight: FontWeight.w800,
    color: AppColors.surface,
  );

  static const TextStyle vipBadgeLabel = TextStyle(
    fontFamily: 'Inter',
    fontSize: 8,
    fontWeight: FontWeight.w700,
    color: AppColors.extraPrimaryLight,
  );
  static const TextStyle vipLocationName = TextStyle(
    fontFamily: 'Inter',
    fontSize: 10,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle vipDoctorLabel = TextStyle(
    fontFamily: 'Inter',
    fontSize: 8,
    fontWeight: FontWeight.w700,
    color: AppColors.vipGoldDark,
  );
  static const selectedLabelStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );
  static const unSelectedLabelStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );
}
