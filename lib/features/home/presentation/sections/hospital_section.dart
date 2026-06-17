import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/widgets/home_section_header.dart';
import '../widgets/hospital_card.dart';

class HomeHospitalsSection extends StatelessWidget {
  const HomeHospitalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingH),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'مستشفيات مميزة'),
          const SizedBox(height: AppConstants.spacing),

          HospitalCard(
            imagePath: AppImages.hospital,
            nameAr: 'مركز SHA Wellness Clinic',
            location: 'إسطنبول، تركيا',
            rating: 4.9,
            reviewsCount: 2341,
            packagesCount: 3,
            badges: const ['ISPA', 'ISO'],
          ),
          const SizedBox(height: 12),

          HospitalCard(
            imagePath: AppImages.hospital,
            nameAr: 'مركز Anantara Healing',
            location: 'بانكوك، تايلاند',
            rating: 4.9,
            reviewsCount: 1876,
            packagesCount: 2,
            badges: const ['ISPA', 'ISO'],
          ),
          const SizedBox(height: 12),

          HospitalCard(
            imagePath: AppImages.hospital,
            nameAr: 'مركز Estetik International',
            location: 'إسطنبول، تركيا',
            rating: 4.8,
            reviewsCount: 3124,
            packagesCount: 5,
            badges: const ['ISAPS', 'JCI'],
          ),
          const SizedBox(height: 12),

          HospitalCard(
            imagePath: AppImages.hospital,
            nameAr: 'عيادة Bumrungrad Body',
            location: 'بانكوك، تايلاند',
            rating: 4.8,
            reviewsCount: 2187,
            packagesCount: 3,
            badges: const ['ISO', 'JCI'],
          ),
        ],
      ),
    );
  }
}