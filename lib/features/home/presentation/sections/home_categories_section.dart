import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/core/router/route_names.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/widgets/home_section_header.dart';
import 'package:login_screen/core/widgets/speciality_card.dart';

class HomeCategoriesSection extends StatefulWidget {
  const HomeCategoriesSection({super.key});

  @override
  State<HomeCategoriesSection> createState() => _HomeCategoriesSectionState();
}

class _HomeCategoriesSectionState extends State<HomeCategoriesSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingH),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ─────────────────────────────
          SectionHeader(
              title: 'التخصصات الطبية',
              onActionTap: () => context.go(RouteNames.specialties)),
          const SizedBox(height: AppConstants.spacing),

          // ── Grid 2x2 ───────────────────────────
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
