import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../theme/app_constants.dart';
import '../theme/app_text_style.dart';

enum AppButtonType { primary, outlined }

enum IconPosition { start, end }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final IconData? icon;
  final String? svgAssetPath;
  final IconPosition iconPosition;
  final double? width;
  final double? height;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.icon,
    this.svgAssetPath,
    this.iconPosition = IconPosition.end,
    this.width = double.infinity,
    this.height,
  });

  Color get _backgroundColor =>
      type == AppButtonType.primary ? AppColors.primary : AppColors.surface;

  Color get _borderColor => type == AppButtonType.primary
      ? AppColors.primary
      : AppColors.secondaryBorder;

  Color get _contentColor => type == AppButtonType.primary
      ? AppColors.surface
      : AppColors.textPrimary;

  Widget _buildIcon() {
    if (svgAssetPath != null) {
      return SvgPicture.asset(
        svgAssetPath!,
        width: 20,
        height: 20,
      );
    }
    if (icon != null) {
      return Icon(icon, color: _contentColor, size: 20);
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final hasIcon = icon != null || svgAssetPath != null;

    final textWidget = Text(
      label,
      style: AppTextStyles.button.copyWith(color: _contentColor),
    );

    return SizedBox(
      width: width,
      height: height ?? AppConstants.buttonHeight,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: _backgroundColor,
          side: BorderSide(color: _borderColor),
              padding: const EdgeInsets.symmetric(horizontal: 12), 

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: hasIcon
              ? (iconPosition == IconPosition.start
                  ? [
                      _buildIcon(),
                      const SizedBox(width: 8),
                      textWidget,
                    ]
                  : [
                      textWidget,
                      const SizedBox(width: 8),
                      _buildIcon(),
                    ])
              : [textWidget],
        ),
      ),
    );
  }
}