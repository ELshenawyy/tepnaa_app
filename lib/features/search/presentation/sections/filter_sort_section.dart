import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/core/widgets/app_button.dart';

class FilterSortSection extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onSelected;

  const FilterSortSection({
    super.key,
    this.selected,
    required this.onSelected,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الترتيب حسب',
          style: AppTextStyles.label.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: AppConstants.spacing),

       Row(
  children: [
    Expanded(
      child: AppButton(
        label: 'الأعلى تقييماً',
        icon: Icons.star_outline_rounded,
        type: selected == 'الأعلى تقييماً'
            ? AppButtonType.primary
            : AppButtonType.outlined,
        onPressed: () => onSelected(
          selected == 'الأعلى تقييماً' ? null : 'الأعلى تقييماً',
        ),
      ),
    ),
    const SizedBox(width: 8),
    Expanded(
      child: AppButton(
        label: 'الأقل سعراً',
        icon: Icons.arrow_downward_rounded,
        type: selected == 'الأقل سعراً' 
            ? AppButtonType.primary 
            : AppButtonType.outlined,
        onPressed: () => onSelected(
          selected == 'الأقل سعراً' ? null : 'الأقل سعراً',
        ),
      ),
    ),
    
  ],
),
SizedBox(height: AppConstants.spacing),
Row(
  children: [
     Expanded(
      child: AppButton(
        label: 'الأعلى سعراً',
        icon: Icons.arrow_upward_rounded,
        type: selected == 'الأعلى سعراً'
            ? AppButtonType.primary
            : AppButtonType.outlined,
        onPressed: () => onSelected(
          selected == 'الأعلى سعراً' ? null : 'الأعلى سعراً',
        ),
      ),
    ),
    const SizedBox(width: 8),
    Expanded(
      child: AppButton(
        label: 'الأكثر مراجعات',
        icon: Icons.circle_outlined,
        type: selected == 'الأكثر مراجعات'
            ? AppButtonType.primary
            : AppButtonType.outlined,
        onPressed: () => onSelected(
          selected == 'الأكثر مراجعات' ? null : 'الأكثر مراجعات',
        ),
      ),
    ),
   
  ],
),
      ],
    );
  }
}