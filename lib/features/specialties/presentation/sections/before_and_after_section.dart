import 'package:flutter/material.dart';
import 'package:login_screen/features/specialties/presentation/sections/before_after_result_section.dart';
import 'package:login_screen/features/specialties/presentation/sections/before_after_states_Section.dart';
import 'before_after_categories_section.dart';

class BeforeAfterSection extends StatelessWidget {
  const BeforeAfterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 20,
      children: [
        
        BeforeAfterStatsSection(),
        BeforeAfterCategoriesSection(),
        BeforeAfterResultsSection(),
      ],
    );
  }
}