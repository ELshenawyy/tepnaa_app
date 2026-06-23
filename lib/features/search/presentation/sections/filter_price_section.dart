import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class FilterPriceSection extends StatelessWidget {
  final RangeValues priceRange;
  final ValueChanged<RangeValues> onChanged;

  const FilterPriceSection({
    super.key,
    required this.priceRange,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── العنوان + القيم ───────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${priceRange.end.toInt()} — \$${priceRange.start.toInt()}',
              style: AppTextStyles.hint.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'السعر (USD)',
              style: AppTextStyles.hint.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.spacingSmall),

        // ── RangeSlider ───────────────────
        RangeSlider(
          values: priceRange,
          min: 0,
          max: 30000,
          activeColor: AppColors.primary,
          inactiveColor: AppColors.border,
          onChanged: onChanged,
        ),

        // ── Min + Max labels ──────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$30,000', style: AppTextStyles.hint.copyWith(fontSize: 11)),
            Text('\$0', style: AppTextStyles.hint.copyWith(fontSize: 11)),
          ],
        ),
      ],
    );
  }
}
