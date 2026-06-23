import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/widgets/home_section_header.dart';
import 'package:login_screen/core/widgets/specialty_list_card.dart';

class AllSpecialtiesSection extends StatelessWidget {
  const AllSpecialtiesSection({super.key});

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
            title: 'كل التخصصات',
          ),

          const SizedBox(
            height: AppConstants.spacing,
          ),

          SpecialtyListCard(
            title: 'الأسنان',
            subtitle: 'ابتسامة هوليود',
            centersCount: '623 مركز',
            imagePath: AppImages.hospital,
            leadingIcon: Icons.medical_services_outlined,
          ),

          const SizedBox(height: 12),

          SpecialtyListCard(
            title: 'القلب',
            subtitle: 'رعاية قلبية متقدمة',
            centersCount: '156 مركز',
            imagePath: AppImages.hospital,
            leadingIcon: Icons.favorite_border,
            leadingColor: Colors.red,
          ),

          const SizedBox(height: 12),

          SpecialtyListCard(
            title: 'الأورام',
            subtitle: 'علاج متكامل',
            centersCount: '89 مركز',
            imagePath: AppImages.hospital,
            leadingIcon: Icons.favorite_outline,
            leadingColor: Colors.purple,
          ),

          const SizedBox(height: 12),

          SpecialtyListCard(
            title: 'العيون',
            subtitle: 'رؤية واضحة وحياة أجمل',
            centersCount: '214 مركز',
            imagePath: AppImages.hospital,
            leadingIcon: Icons.remove_red_eye_outlined,
            leadingColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}