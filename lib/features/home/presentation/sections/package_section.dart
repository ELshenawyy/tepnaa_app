import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/widgets/home_section_header.dart';
import '../widgets/package_card.dart';

class HomePackagesSection extends StatelessWidget {
  const HomePackagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingH,
          ),
          child: const SectionHeader(title: 'باقات مميزة'),
        ),
        const SizedBox(height: AppConstants.spacing),

        // ── Cards horizontal scroll ────────────
        SizedBox(
          height: 240,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingH,
            ),
            children: [
              PackageCard(
                imagePath: AppImages.hospital,
                packageName: 'برنامج إزالة السموم 3 أيام',
                hospitalName: 'مركز SHA Wellness Clinic',
                price: '\$1,200',
                discount: '33%-',
                category: 'الاستشفاء',
              ),
              const SizedBox(width: 12),
              PackageCard(
                imagePath: AppImages.hospital,
                packageName: 'برنامج التجديد الشامل 7 أيام',
                hospitalName: 'مركز SHA Wellness Clinic',
                price: '\$2,800',
                discount: '33%-',
                category: 'الاستشفاء',
              ),
              const SizedBox(width: 12),
              PackageCard(
                imagePath: AppImages.hospital,
                packageName: 'برنامج التجميل المتكامل',
                hospitalName: 'مركز Estetik International',
                price: '\$3,500',
                discount: '20%-',
                category: 'التجميل',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
