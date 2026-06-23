import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/core/localization/translation_keys.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class SearchInputBar extends StatelessWidget {
  final double filterCount;
  final TextEditingController controller;
  final VoidCallback? onFilterTap;
  final ValueChanged<String>? onChanged;

  const SearchInputBar({
    super.key,
    required this.controller,
    this.onFilterTap,
    this.onChanged,
    this.filterCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ── Search Bar ────────────────────────
        Expanded(
          child: Container(
            height: 54,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.secondaryBorder),
            ),
            child: Row(
              children: [
                // ── TextField ───────────────────
                Expanded(
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged,
                    style: AppTextStyles.label,
                    decoration: InputDecoration(
                      hintText: TKeys.searchHint.tr(),
                      hintStyle: AppTextStyles.hint
                          .copyWith(color: AppColors.textPrimary),
                      border: InputBorder.none,
                      isDense: true,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.searchIconColor,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),

        // ── Filter Button + Badge ─────────────
        GestureDetector(
          onTap: onFilterTap,
          child: Stack(
            children: [
              Container(
                width: AppConstants.fieldHeight,
                height: AppConstants.fieldHeight,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.tune_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),

              // ── Badge عدد الفلاتر ──────────────
              if (filterCount > 0)
                Positioned(
                  top: -6,
                  right: -6,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        filterCount.toInt().toString(),
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
