import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/features/home/presentation/widgets/why_tebna_card.dart';
import 'package:login_screen/features/home/presentation/widgets/why_tebna_item.dart';

class WhyTebnaaSection extends StatelessWidget {
  const WhyTebnaaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return WhyTebnaaCard(
      banner: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: AppConstants.logoHeight,
              decoration: BoxDecoration(
                color: AppColors.primaryDark,
              ),
            ),
            Text(
              'لماذا طبنا؟',
              style: TextStyle(
                color: AppColors.surface,
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
      items: const [
        WhyTebnaaItem(
          icon: Icons.local_hospital_outlined,
          title: '+100 مستشفى معتمد',
          subtitle: 'في 30 دولة حول العالم',
          iconColor: AppColors.primary,
          backgroundColor: Color(0xffEEF7F4),
        ),
        WhyTebnaaItem(
          icon: Icons.support_agent_outlined,
          title: 'دعم عربي 24/7',
          subtitle: 'منسقون طبيون متاحون دائماً',
          iconColor: Color(0xffC5A25D),
          backgroundColor: Color(0xffFBF5E8),
        ),
        WhyTebnaaItem(
          icon: Icons.verified_user_outlined,
          title: 'ضمان الجودة',
          subtitle: 'مستشفيات معتمدة ISO و JCI',
          iconColor: AppColors.primary,
          backgroundColor: Color(0xffEEF7F4),
        ),
        WhyTebnaaItem(
          icon: Icons.flight_takeoff_outlined,
          title: 'خدمات متكاملة',
          subtitle: 'تأشيرة، إقامة، نقل، ترجمة',
          iconColor: Color(0xffC5A25D),
          backgroundColor: Color(0xffFBF5E8),
        ),
      ],
    );
  }
}
