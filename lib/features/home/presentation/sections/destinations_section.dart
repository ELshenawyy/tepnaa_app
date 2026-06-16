import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/widgets/home_section_header.dart';
import '../widgets/destination_card.dart';

class HomeDestinationsSection extends StatelessWidget {
  const HomeDestinationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingH),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'الوجهات الأكثر طلباً'),
          const SizedBox(height: AppConstants.spacing),

          SizedBox(
            height: 180,
            child: Row(
              children: [
                Expanded(
                  flex : 3,
                  child: DestinationCard(
                    imagePath: AppImages.hospital,
                    flagEmoji: '🇹🇷',
                    countryName: 'تركيا',
                    hospitalsCount: '312 مستشفى',
                    badgeText: 'الأكثر طلباً',
                    badgeColor: AppColors.primary,
                    badgeTextColor: Colors.white,
                    description: 'تجميل، أسنان • شعر',
                    showButton: true,
                    flagPosition: FlagPosition.topLeft,
                    showIcon: true,
                    titleFontSize: 20,
                  ),
                ),
                const SizedBox(width: 8),

                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        child: DestinationCard(
                          imagePath: AppImages.hospital,
                          flagEmoji: '🇩🇪',
                          countryName: 'ألمانيا',
                          hospitalsCount: '198 مستشفى',
                          badgeText: 'تقنية متقدمة',
                          badgeColor: AppColors.badgeBlue,
                          badgeTextColor: AppColors.badgeBlueText,
                          titleFontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: DestinationCard(
                          imagePath: AppImages.hospital,
                          flagEmoji: '🇹🇭',
                          countryName: 'تايلاند',
                          hospitalsCount: '134 مستشفى',
                          badgeText: 'أسعار مميزة',
                          badgeColor: AppColors.badgeOrange,
                          badgeTextColor: AppColors.badgeOrangeText,
                          titleFontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          SizedBox(
            height: 116,
            child: Row(
              children: [
                Expanded(
                  child: DestinationCard(
                    imagePath: AppImages.hospital,
                    flagEmoji: '🇮🇳',
                    countryName: 'الهند',
                    hospitalsCount: '245 مستشفى',
                    badgeText: 'اقتصادي',
                    badgeColor: AppColors.badgePurple,
                    badgeTextColor: AppColors.badgePurpleText,
                    flagPosition: FlagPosition.topLeft,
                  ),
                ),
               
                const SizedBox(width: 8),
                 Expanded(
                  child: DestinationCard(
                    imagePath: AppImages.hospital,
                    flagEmoji: '🇪🇸',
                    countryName: 'إسبانيا',
                    hospitalsCount: '112 مستشفى',
                    badgeText: 'وجهة جديدة',
                    badgeColor: AppColors.badgePink,
                    badgeTextColor: AppColors.badgePinkText,
                    flagPosition: FlagPosition.topLeft,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
