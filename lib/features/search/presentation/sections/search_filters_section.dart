import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/widgets/app_filter_chip.dart';
import 'package:login_screen/features/specialties/data/models/specialty_filter_model.dart';

class SearchFiltersSection extends StatefulWidget {
  final ValueChanged<String> onCategorySelected;
  final ValueChanged<String> onSubCategorySelected;
  const SearchFiltersSection(
      {super.key,
      required this.onCategorySelected,
      required this.onSubCategorySelected});

  @override
  State<SearchFiltersSection> createState() => _SearchFiltersSectionState();
}

class _SearchFiltersSectionState extends State<SearchFiltersSection> {
  String _selectedCategory = 'الكل';
  String _selectedSubCategory = '';

  static const List<SpecialtyFilterModel> _categories = [
    SpecialtyFilterModel(label: 'الكل', icon: Icons.grid_view),
    SpecialtyFilterModel(label: 'التأهيل الطبي', icon: Icons.favorite_border),
    SpecialtyFilterModel(label: 'الديتوكس', icon: Icons.spa_outlined),
    SpecialtyFilterModel(label: 'التجميل', icon: Icons.auto_awesome_outlined),
  ];

  static const List<SpecialtyFilterModel> _subCategories = [
    SpecialtyFilterModel(label: 'إصابة رياضية', icon: Icons.sports_outlined),
    SpecialtyFilterModel(
        label: 'بعد العمليات', icon: Icons.medical_services_outlined),
    SpecialtyFilterModel(
        label: 'التأهيل العصبي', icon: Icons.psychology_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _categories.map((filter) {
              return Padding(
                padding: const EdgeInsets.only(left: 8),
                child: AppFilterChip(
                  label: filter.label,
                  icon: filter.icon,
                  isActive: filter.label == _selectedCategory,
                  onTap: () {
                    setState(() => _selectedCategory = filter.label);
                    widget.onCategorySelected(filter.label);
                  },
                ),
              );
            }).toList(),
          ),
        ),
        Divider(color: AppColors.border, height: AppConstants.spacing * 2),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _subCategories.map((filter) {
              return Padding(
                padding: const EdgeInsets.only(left: 8),
                child: AppFilterChip(
                  label: filter.label,
                  icon: filter.icon,
                  isActive: filter.label == _selectedSubCategory,
                  onTap: () {
                    setState(() => _selectedSubCategory = filter.label);
                    widget.onSubCategorySelected(filter.label);
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
