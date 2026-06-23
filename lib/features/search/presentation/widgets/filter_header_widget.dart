import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class FilterHeaderWidget extends StatelessWidget {
  final VoidCallback onClearAll;
  final VoidCallback onClose;

  const FilterHeaderWidget({
    super.key,
    required this.onClearAll,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingH,
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onClearAll,
            child: Text(
              'مسح الكل',
              style: AppTextStyles.label.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            'الفلتر',
            style: AppTextStyles.heading.copyWith(fontSize: 16),
          ),
          GestureDetector(
            onTap: onClose,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.iconBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.close,
                color: AppColors.textPrimary,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}