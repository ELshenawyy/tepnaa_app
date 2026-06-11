import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/core/localization/translation_keys.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_constants.dart';

enum AuthTab { login, register }

class AuthTabBar extends StatelessWidget {
  final AuthTab activeTab;
  final VoidCallback? onLoginTap;
  final VoidCallback? onRegisterTap;

  const AuthTabBar({
    super.key,
    required this.activeTab,
    this.onLoginTap,
    this.onRegisterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Row(
        children: [
          // ── تسجيل الدخول ──────────────────────
          Expanded(
            child: GestureDetector(
              onTap: onLoginTap,
              child: _TabItem(
                label: TKeys.loginTitle.tr(),
                isActive: activeTab == AuthTab.login,
              ),
            ),
          ),

          // ── تسجيل جديد ────────────────────────
          Expanded(
            child: GestureDetector(
              onTap: onRegisterTap,
              child: _TabItem(
                label: TKeys.newRegister.tr(),
                isActive: activeTab == AuthTab.register,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool isActive;

  const _TabItem({required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius - 2),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Inter',
          color: isActive ? AppColors.surface : AppColors.textSecondary,
          fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
  }
}
