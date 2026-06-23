import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

import '../../../../core/theme/app_constants.dart';

class FilterHeaderSection extends StatelessWidget {
  final VoidCallback onClearAll;

  const FilterHeaderSection({
    super.key,
    required this.onClearAll,
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
          // ── مسح الكل ──────────────────────
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

          // ── العنوان ───────────────────────
          Text(
            'الفلتر',
            style: AppTextStyles.heading.copyWith(fontSize: 16),
          ),

          // ── زرار الإغلاق ──────────────────
          GestureDetector(
            onTap: () => Navigator.pop(context),
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