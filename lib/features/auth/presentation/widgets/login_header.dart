import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import '../../../../core/theme/app_constants.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.headerHeight, // 180.0
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // ── 1. صورة الخلفية ──────────────────
          Image.asset(
            'assets/images/header_bg.png',
            fit: BoxFit.cover,
          ),

          // ── 2. Green gradient overlay ─────────
          Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xA60D3A2E),
        Color(0xEB0D3A2E), 
      ],
      stops: [0.0, 1.0],
    ),
  ),
),

          // ── 3. Logo + Texts ───────────────────
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingH,
              vertical: AppConstants.paddingV,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // وسط
              children: [
                // اللوجو في المنتصف
                Image.asset(
                  'assets/images/tibna_logo.png',
                  height: AppConstants.logoHeight,
                  width: AppConstants.logoWeight,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 8),

                // ── 4. النصوص تحت اللوجو ─────────
                Text(
                  'بوابة مقدمي الخدمة',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.surface,
                  ),
                ),
                Text(
                  'انضم لشبكة طبنا الطبية',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}