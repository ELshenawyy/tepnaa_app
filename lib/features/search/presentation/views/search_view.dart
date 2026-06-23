import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/features/search/presentation/sections/search_bar_section.dart';
import 'package:login_screen/features/search/presentation/sections/search_filters_section.dart';
import 'package:login_screen/features/search/presentation/sections/search_header_section.dart';
import 'package:login_screen/features/search/presentation/sections/search_results_section.dart';
import 'package:login_screen/features/search/presentation/widgets/filter_bottom_sheet.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  // ── State ─────────────────────────────────
  final _controller = TextEditingController();
  String _selectedCategory = 'الكل';
  String _selectedSubCategory = ''; 

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConstants.paddingH),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ──────────────────────
              const SearchHeaderSection(),
              const SizedBox(height: AppConstants.spacing),

              // ── Search Bar ──────────────────
              SearchBarSection(
                controller: _controller,
                onChanged: (value) => setState(() {}),
                onFilterTap: () async {
                  final result = await FilterBottomSheet.show(context);
                  if (result != null) {
                    // TODO: استخدم الـ filter مع الـ Cubit
                  }
                },
              ),
              const SizedBox(height: AppConstants.spacing),

              // ── Filters ─────────────────────
              SearchFiltersSection(
                onCategorySelected: (category) =>
                    setState(() => _selectedCategory = category),
                onSubCategorySelected: (subCategory) =>
                    setState(() => _selectedSubCategory = subCategory),
              ),
              const SizedBox(height: AppConstants.spacing),

              // ── Results ─────────────────────
              Expanded(
                child: SearchResultsSection(
                  hospitalsCount: 3,
                  packagesCount: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
