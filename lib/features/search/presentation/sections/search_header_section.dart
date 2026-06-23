import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/core/router/route_names.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class SearchHeaderSection extends StatelessWidget {
  const SearchHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingH),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "البحث والإستكشاف",
            style: AppTextStyles.heading.copyWith(fontSize: 18),
          ),
          GestureDetector(
            onTap: () => context.go(RouteNames.home),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColors.border, width: 1),
                color: AppColors.surface,
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.textPrimary,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
