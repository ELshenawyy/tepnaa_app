import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/core/localization/translation_keys.dart';
import 'package:login_screen/core/router/route_names.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    
    context.go(RouteNames.language);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Column(
        children: [
          const Spacer(),

          // ── Logo ──────────────────────────────
          Center(
            child: Image.asset(
              'assets/images/tibna_logo.png',
              height: AppConstants.wElcomelogoHeight,
              width: AppConstants.welcomelogoWeight,
              fit: BoxFit.contain,
            ),
          ),

          const Spacer(),

          // ── النصوص في المنتصف ─────────────────
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  TKeys.welcomeTagline.tr(),
                  style: TextStyle(fontFamily: 'Inter',
                    color: const Color(0xFF5A7A72),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),

                // ── الخط الأخضر ───────────────────
                Container(
                  width: 118,
                  height: 2,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 12),

                Text(
                  TKeys.loading.tr(),
                  style: TextStyle(fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFA0B5B0),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 78),
        ],
      ),
    );
  }
}