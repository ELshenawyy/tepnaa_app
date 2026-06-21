import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String tag;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.tag,
    required this.title,
    required this.description,
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

        // ── 3. المحتوى في الأسفل ──────────────
        Positioned(
          bottom: 120, // ← مساحة للزراين اللي هتبقى خارج
          left: 20,
          right: 20,
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
                    Text(tag, style: AppTextStyles.onboardingTag),
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
                style: AppTextStyles.hint.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }
}