import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/core/localization/app_locate.dart';
import 'package:login_screen/core/localization/translation_keys.dart';
import 'package:login_screen/core/router/route_names.dart';
import 'package:login_screen/core/widgets/app_button.dart';
import 'package:login_screen/features/onBoarding/presentation/widgets/language_opthions.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_constants.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selected = 'ar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Column(
        children: [
          // ── Logo ──────────────────────────────
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 24),
            child: Image.asset(
              'assets/images/tibna_logo.png',
              height: AppConstants.wElcomelogoHeight,
              width: AppConstants.welcomelogoWeight,
              fit: BoxFit.contain,
            ),
          ),

          const Spacer(),

          // ── Content ───────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingH,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ── Title ─────────────────────────
                Text(
                  TKeys.selectLanguage.tr(),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 2),

                // ── Subtitle ──────────────────────
                Text(
                  TKeys.selectLanguageSub.tr(),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 32),

                // ── العربية ───────────────────────
                LanguageOption(
                  flag: '🇸🇦',
                  name: TKeys.arabic.tr(),
                  subName: 'Arabic',
                  isSelected: _selected == 'ar',
                  onTap: () => setState(() => _selected = 'ar'),
                ),
                const SizedBox(height: 12),

                // ── English ───────────────────────
                LanguageOption(
                  flag: '🇬🇧',
                  name: TKeys.english.tr(),
                  subName: 'الإنجليزية',
                  isSelected: _selected == 'en',
                  onTap: () => setState(() => _selected = 'en'),
                ),
              ],
            ),
          ),

          const Spacer(),

          // ── Button ────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingH,
            ),
            child: SizedBox(
              width: double.infinity,
              height: AppConstants.buttonHeight,
              child: AppButton(
                label: TKeys.continueBtn.tr(),
                icon: Icons.arrow_forward_outlined,
                onPressed: () {
                  context.setLocale(
                    _selected == 'ar' ? AppLocale.ar : AppLocale.en,
                  );
                  context.go(RouteNames.onBoarding);
                },
              ),
            ),
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
