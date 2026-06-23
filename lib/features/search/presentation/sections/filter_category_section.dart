import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/core/widgets/app_filter_chip.dart';

class FilterCategorySection extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onSelected;

  const FilterCategorySection({
    super.key,
    required this.selected,
    required this.onSelected, 
  });

  static const List<String> _categories = [
    'الكل',
    'التأهيل الطبي',
    'الديتوكس',
    'التجميل',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── العنوان ───────────────────────
        Text(
          'القسم الرئيسي',
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
              fontSize: 12,
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