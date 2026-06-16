import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/features/home/presentation/widgets/speciality_tag.dart';

class HomeSpecialtiesSection extends StatelessWidget {
  const HomeSpecialtiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingH),
        children: [
          SpecialtyTag(
            icon: Icons.remove_red_eye_outlined,
            label: 'العيون',
            backgroundColor: AppColors.tagBackground,
            iconColor: AppColors.tagPurpleIcon,
          ),
          const SizedBox(width: 8),
          SpecialtyTag(
            icon: Icons.favorite_outline,
            label: 'الأورام',
            backgroundColor: AppColors.tagBackground,
            iconColor: AppColors.tagPurpleIcon,
          ),
          const SizedBox(width: 8),
          SpecialtyTag(
            icon: Icons.favorite,
            label: 'القلب',
            backgroundColor: AppColors.tagBackground,
            iconColor: AppColors.tagPinkIcon,
          ),
          const SizedBox(width: 8),
          SpecialtyTag(
            icon: Icons.medical_services_outlined,
            label: 'الأسنان',
            backgroundColor: AppColors.tagBackground,
            iconColor: AppColors.tagTealIcon,
          ),
        ],
      ),
    );
  }
}