import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/core/localization/translation_keys.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class HomeSearchBar extends StatelessWidget {
  final VoidCallback? onFilterTap;
  final double? size;

  const HomeSearchBar({super.key, this.onFilterTap, this.size = 34});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.secondaryBorder),
      ),
      child: Row(
        children: [
          const SizedBox(width: 17),
          GestureDetector(
            onTap: onFilterTap,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primary,
              ),
              child: const Icon(
                Icons.tune,
                color: Colors.white,
                size: 14,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              TKeys.searchHint.tr(),
              style: AppTextStyles.hint,
            ),
          ),
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.iconBackground,
            ),
            child: const Icon(
              Icons.search,
              color: AppColors.primary,
              size: 16,
            ),
          ),
          SizedBox(width: 17),
        ],
      ),
    );
  }
}
