import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/widgets/app_button.dart';
import 'package:login_screen/features/search/data/models/search_filter_model.dart';
import 'package:login_screen/features/search/presentation/sections/filter_category_section.dart';
import 'package:login_screen/features/search/presentation/sections/filter_country_section.dart';
import 'package:login_screen/features/search/presentation/sections/filter_price_section.dart';
import 'package:login_screen/features/search/presentation/sections/filter_rating_section.dart';
import 'package:login_screen/features/search/presentation/sections/filter_sort_section.dart';
import 'package:login_screen/features/search/presentation/sections/filter_sub_category_section.dart';
import 'package:login_screen/features/search/presentation/widgets/filter_header_widget.dart';

class FilterBottomSheetView extends StatefulWidget {
  const FilterBottomSheetView({super.key});

  @override
  State<FilterBottomSheetView> createState() => _FilterBottomSheetViewState();
}

class _FilterBottomSheetViewState extends State<FilterBottomSheetView> {
  String? _selectedCategory;
  String? _selectedSubCategory;
  RangeValues _priceRange = const RangeValues(0, 11500);
  String? _selectedRating;
  String? _selectedCountry;
  String? _selectedSort;

  void _applyFilter() {
    Navigator.pop(
      context,
      SearchFilterModel(
        category: _selectedCategory,
        subCategory: _selectedSubCategory,
        minPrice: _priceRange.start,
        maxPrice: _priceRange.end,
        rating: _selectedRating != null
            ? double.parse(_selectedRating!.replaceAll('+', ''))
            : null,
        country: _selectedCountry,
        sortBy: _selectedSort,
      ),
    );
  }

  void _clearAll() {
    setState(() {
      _selectedCategory = null;
      _selectedSubCategory = null;
      _priceRange = const RangeValues(0, 11500);
      _selectedRating = null;
      _selectedCountry = null;
      _selectedSort = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      maxChildSize: 0.9,
      minChildSize: 0.5,
      expand: false,
      builder: (_, scrollController) {
        return Column(
          children: [
            // ── Header ──────────────────────
            FilterHeaderWidget(
              onClearAll: _clearAll,
              onClose: () => Navigator.pop(context),
            ),

            const Divider(color: AppColors.border, height: 1),

            // ── Sections ────────────────────
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.all(AppConstants.paddingH),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilterCategorySection(
                      selected: _selectedCategory,
                      onSelected: (v) => setState(() => _selectedCategory = v),
                    ),
                    const SizedBox(height: AppConstants.spacing),
                    FilterSubCategorySection(
                      selected: _selectedSubCategory,
                      onSelected: (v) =>
                          setState(() => _selectedSubCategory = v),
                    ),
                    const SizedBox(height: AppConstants.spacing),
                    FilterPriceSection(
                      priceRange: _priceRange,
                      onChanged: (v) => setState(() => _priceRange = v),
                    ),
                    const SizedBox(height: AppConstants.spacing),
                    FilterRatingSection(
                      selected: _selectedRating,
                      onSelected: (v) => setState(() => _selectedRating = v),
                    ),
                    const SizedBox(height: AppConstants.spacing),
                    FilterCountrySection(
                      selected: _selectedCountry,
                      onSelected: (v) => setState(() => _selectedCountry = v),
                    ),
                    const SizedBox(height: AppConstants.spacing),
                    FilterSortSection(
                      selected: _selectedSort,
                      onSelected: (v) => setState(() => _selectedSort = v),
                    ),
                  ],
                ),
              ),
            ),

            // ── زرار عرض النتائج ────────────
            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingH),
              child: AppButton(
                label: 'عرض النتائج',
                onPressed: _applyFilter,
              ),
            ),
          ],
        );
      },
    );
  }
}
