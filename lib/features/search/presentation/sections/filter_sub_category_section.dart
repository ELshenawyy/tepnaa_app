import 'package:flutter/widgets.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/core/widgets/app_filter_chip.dart';

class FilterSubCategorySection extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onSelected;

  const FilterSubCategorySection(
      {super.key, this.selected, required this.onSelected});

  static const List<String> _categories = [
    ' إصابة رياضية',
    'بعد العمليات',
    'التأهيل العصبي',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── العنوان ───────────────────────
        Text(
          'التخصص الفرعي',
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
            final isActive = category == selected;

            return AppFilterChip(
              label: category,
              isActive: isActive,
              fontSize: 12,
              onTap: () => onSelected(category),
            );
          }).toList(),
        ),
      ],
    );
  }
}
