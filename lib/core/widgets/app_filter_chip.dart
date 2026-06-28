import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class AppFilterChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isActive;
  final VoidCallback onTap;
  final double? fontSize;
  final Color? activeColor;
  final Color? activeBorderColor;
  final Color? activeLabelColor;

  const AppFilterChip({
    super.key,
    required this.label,
    this.icon,
    required this.isActive,
    required this.onTap,
    this.fontSize,
    this.activeColor,
    this.activeBorderColor,
    this.activeLabelColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color:
              isActive ? (activeColor ?? AppColors.primary) : AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive
                ? (activeBorderColor ?? AppColors.primary)
                : AppColors.secondaryBorder,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon!,
                size: AppConstants.spacingSmall,
                color: isActive ? AppColors.surface : AppColors.textPrimary,
              ),
              const SizedBox(width: 4),
            ],
            const SizedBox(width: 4),
            Text(
              label,
              style: AppTextStyles.label.copyWith(
                fontSize: 11,
                color: isActive
                    ? (activeLabelColor ?? AppColors.surface)
                    : AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
