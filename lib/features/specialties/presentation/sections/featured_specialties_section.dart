import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/widgets/home_section_header.dart';

import '../../../../core/widgets/speciality_card.dart';

class FeaturedSpecialtiesSection extends StatelessWidget {
  const FeaturedSpecialtiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingH,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'تخصصات مميزة',
          ),

          const SizedBox(
            height: AppConstants.spacing,
          ),

          Row(
            children: [
              Expanded(
                child: SpecialityCard(
                  imagePath: AppImages.medicalRehab,
                  icon: Icons.favorite_border,
                  titleAr: 'التأهيل الطبي',
                  titleEn: 'Medical Rehab',
                  centersCount: '178 مركز',
                  isHighlighted: true,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SpecialityCard(
                  imagePath: AppImages.detoxWellness,
                  icon: Icons.spa_outlined,
                  titleAr: 'الديتوكس والعناية',
                  titleEn: 'Detox & Wellness',
                  centersCount: '284 مركز',
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: SpecialityCard(
                  imagePath: AppImages.aestheticBeauty,
                  icon: Icons.auto_awesome_outlined,
                  titleAr: 'التجميل والجمال',
                  titleEn: 'Aesthetic & Beauty',
                  centersCount: '512 مركز',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SpecialityCard(
                  imagePath: AppImages.surgeries,
                  icon: Icons.local_hospital_outlined,
                  titleAr: 'العمليات الجراحية',
                  titleEn: 'Surgeries',
                  centersCount: '156 مركز',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}