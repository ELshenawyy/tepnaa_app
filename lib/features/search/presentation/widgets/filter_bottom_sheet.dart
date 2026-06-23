import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/features/search/data/models/search_filter_model.dart';
import 'package:login_screen/features/search/presentation/views/filter_botton_sheet_view.dart';

class FilterBottomSheet {
  static Future<SearchFilterModel?> show(BuildContext context) {
    return showModalBottomSheet<SearchFilterModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      builder: (_) => const FilterBottomSheetView(),
    );
  }
}