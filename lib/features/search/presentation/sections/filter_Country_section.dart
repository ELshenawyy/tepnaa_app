import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/core/widgets/app_filter_chip.dart';

class FilterCountrySection extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onSelected;
  final Color? activeLabelColor;


  const FilterCountrySection(
      {super.key, this.selected, required this.onSelected, this.activeLabelColor});

  static const Map<String, String> _countries = {
    'الكل': '🌍',
    'تركيا': '🇹🇷',
    'ألمانيا': '🇩🇪',
    'الهند': '🇮🇳',
    'تايلاند': '🇹🇭',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── العنوان ───────────────────────
        Text(
          'الدولة',
          style: AppTextStyles.label.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: AppConstants.spacing),

        // ── Chips ─────────────────────────
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _countries.keys.map((country) {
                  final isActive =
                    country == selected || (country == 'الكل' && selected == null);
                return AppFilterChip(
                  label: '${_countries[country]} $country',
                  isActive: isActive,
                  activeColor: country != 'الكل' ? AppColors.iconBackground : null,
                  activeBorderColor: country != 'الكل' ? AppColors.primary : null,
                  activeLabelColor: activeLabelColor ?? (country != 'الكل' ? AppColors.primary : null),
                  
                  fontSize: 12,
                  onTap: () => onSelected(
                    country == 'الكل' ? null : country,
                  ),
                );
              }).toList(),
            ),
                 ] ),
        ),
      ],
    );
  }
}
