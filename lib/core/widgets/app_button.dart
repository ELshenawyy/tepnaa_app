import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_constants.dart';
import '../theme/app_text_style.dart';

enum AppButtonType { primary, outlined }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final IconData? icon;
  final double? width;
  final double? height;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.icon,
    this.width = double.infinity,
    this.height,
  });

  Color get _backgroundColor =>
      type == AppButtonType.primary ? AppColors.primary : AppColors.surface;

  Color get _borderColor => type == AppButtonType.primary
      ? AppColors.primary
      : AppColors.secondaryBorder;

  Color get _contentColor =>
      type == AppButtonType.primary ? AppColors.surface : AppColors.textPrimary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? AppConstants.buttonHeight,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: _backgroundColor,
          side: BorderSide(color: _borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTextStyles.button.copyWith(color: _contentColor),
            ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              Icon(icon, color: _contentColor, size: 20),
            ],
          ],
        ),
      ),
    );
  }
}
