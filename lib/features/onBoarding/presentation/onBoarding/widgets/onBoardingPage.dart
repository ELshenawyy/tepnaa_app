import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/core/localization/translation_keys.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/core/widgets/app_button.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String tag;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onButtonTap;
  final VoidCallback onSkip;
  final int currentIndex;
  final int total;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.tag,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onButtonTap,
    required this.onSkip,
    required this.currentIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── 1. صورة الخلفية ───────────────────
        SizedBox.expand(
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),

        // ── 2. Gradient overlay ───────────────
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x330A1E18),
                Color(0xB30A1E18),
                Color(0xF70A1E18),
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
        ),

        // ── 3. تخطي + Dots ────────────────────
        Padding(
          padding: const EdgeInsets.only(top: 48, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ── Dots ──────────────────────────
              Row(
                children: List.generate(total, (i) {
                  final isActive = i == currentIndex;
                  return Container(
                    margin: const EdgeInsets.only(right: 6),
                    width: isActive ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.primary : Colors.white38,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),

              // ── تخطي ──────────────────────────
              GestureDetector(
                onTap: onSkip,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0x26FFFFFF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    TKeys.skip.tr(),
                    style: AppTextStyles.skipButton,
                  ),
                ),
              ),
            ],
          ),
        ),

        // ── 4. المحتوى في الأسفل ──────────────
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Tag ───────────────────────────
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0x26FFFFFF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        tag,
                        style: AppTextStyles.onboardingTag,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // ── Title ─────────────────────────
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.onboardingTitle,
                ),
                const SizedBox(height: 8),

                // ── Description ───────────────────
                Text(
                  description,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.hint,
                ),
                const SizedBox(height: 24),

                // ── Button ────────────────────────
                AppButton(
                  label: buttonText,
                  icon: Icons.arrow_forward_outlined,
                  onPressed: onButtonTap,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
