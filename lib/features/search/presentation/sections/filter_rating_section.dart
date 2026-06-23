import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/core/widgets/app_filter_chip.dart';

class FilterRatingSection extends StatelessWidget {
   final String? selected;
  final ValueChanged<String?> onSelected;

  const FilterRatingSection(
      {super.key, this.selected, required this.onSelected});

 static const List<String> _categories = [
  'الكل', '4.8+', '4.5+', '4+',
];


  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── العنوان ───────────────────────
        Text(
          'التقييم',
          style: AppTextStyles.label.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),

        // ── Chips ─────────────────────────
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _categories.map((category) {
            final isActive = category == selected ||
                (category == 'الكل' && selected == null);
            return AppFilterChip(
              label: category,
              isActive: isActive,
              activeColor: category != 'الكل' ? AppColors.vipGold : null,
              activeBorderColor: category != 'الكل' ? AppColors.vipGold : null,
              fontSize: 12,
              icon: category != 'الكل' ? Icons.star : null,
              onTap: () => onSelected(
                category == 'الكل' ? null : category,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}