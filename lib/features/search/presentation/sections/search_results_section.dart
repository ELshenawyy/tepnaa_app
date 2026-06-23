import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/features/search/presentation/sections/search_tab_section.dart';

class SearchResultsSection extends StatelessWidget {
  final int hospitalsCount;
  final int packagesCount;

  int get resultsCount => hospitalsCount + packagesCount;

  const SearchResultsSection({
    super.key,
    required this.hospitalsCount,
    required this.packagesCount,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // ── عدد النتائج ───────────────────────

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingH,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$resultsCount ',
                style: AppTextStyles.tagline.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'نتيجة',
                style: AppTextStyles.languageSubName
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppConstants.spacing),

        // ── Tabs + Results ────────────────────
        Expanded(
          child: SearchTabsSection(
            hospitalsCount: 3,
            packagesCount: 0,
          ),
        ),
      ],
    );
  }
}
