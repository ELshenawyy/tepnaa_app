import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import '../widgets/vip_banner.dart';
import '../widgets/vip_doctor_card.dart';

class HomeVipDoctorsSection extends StatelessWidget {
  const HomeVipDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header ─────────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingH,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 45,
                    height: 17,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.vipGold,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          AppImages.vipBicture,
                          color: AppColors.surface,
                          height: 9,
                          width: 9,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'VIP',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'أطباء VIP حصريون',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Text(
                'عرض الكل',
                style: AppTextStyles.link.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.vipGold),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppConstants.spacing),

        // ── VIP Banner ─────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingH,
          ),
          child: const VipBanner(),
        ),
        const SizedBox(height: AppConstants.spacing),

        // ── Doctor Cards (horizontal scroll) ───
        SizedBox(
          height: 280,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingH,
            ),
            children: [
              VipDoctorCard(
                roomImagePath: AppImages.hospital,
                doctorImagePath: AppImages.profilePic,
                doctorName: 'د. إيلكر أبابيدن',
                specialty: 'جراحة التجميل للمشاهير',
                rating: 5,
                waitingMonths: 8,
                price: '\$15,000',
                badgeLabel: 'حصري طبنا',
                locationName: 'إسطنبول',
                locationEmoji: '🇹🇷',
                doctorLabel: 'طبيب المشاهير',
              ),
              const SizedBox(width: 12),
              VipDoctorCard(
                roomImagePath: AppImages.hospital,
                doctorImagePath: AppImages.profilePic,
                doctorName: 'د. أنيتا شاه',
                specialty: 'تجميل الجلد والليزر',
                rating: 5,
                waitingMonths: 5,
                price: '\$8,000',
                badgeLabel: 'حصري طبنا',
                locationName: 'مومباي',
                locationEmoji: '🇮🇳',
                doctorLabel: 'طبيب المشاهير',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
