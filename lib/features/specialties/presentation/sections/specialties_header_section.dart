import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';

import '../../../../core/theme/app_text_style.dart';
class SpecialtiesHeaderSection extends StatelessWidget {
  const SpecialtiesHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "التخصصات",
            style: AppTextStyles.selsectlangTitle.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
      
          Text(
            "10 تخصص • 2915 مركز طبي",
            style: AppTextStyles.hint.copyWith(
              color: AppColors.hint,
            ),
          ),
        ],
      ),
    );
  }
}