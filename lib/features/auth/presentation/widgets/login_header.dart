import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import '../../../../core/theme/app_constants.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.headerHeight,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // ── 1. صورة الخلفية ──────────────────
          Image.asset(
            AppImages.headerBg,
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
              crossAxisAlignment: CrossAxisAlignment.center,  
              children: [
                // اللوجو في المنتصف
                Image.asset(
                  AppImages.tibnaLogo,
                  height: AppConstants.logoHeight,
                  width: AppConstants.logoWeight,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 8),

                // ── 4. النصوص تحت اللوجو ─────────
                Text(
                  'بوابة مقدمي الخدمة',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headerTitle,
                ),
                Text(
                  'انضم لشبكة طبنا الطبية',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headerSubtitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
