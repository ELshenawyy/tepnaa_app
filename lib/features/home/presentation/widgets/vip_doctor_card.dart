import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'vip_book_button.dart';

class VipDoctorCard extends StatelessWidget {
  final String roomImagePath;
  final String doctorImagePath;
  final String doctorName;
  final String specialty;
  final int rating;
  final int waitingMonths;
  final String price;
  final String badgeLabel;
  final String doctorLabel;

  final String? locationEmoji;
  final String? locationName;
  final VoidCallback? onTap;

  const VipDoctorCard({
    super.key,
    required this.roomImagePath,
    required this.doctorImagePath,
    required this.doctorName,
    required this.specialty,
    required this.rating,
    required this.waitingMonths,
    required this.price,
    required this.badgeLabel,
    required this.doctorLabel,
    this.locationEmoji,
    this.locationName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── صورة الغرفة + أوفرلاي ───────────────
          SizedBox(
            height: 110,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Image.asset(
                    roomImagePath,
                    width: double.infinity,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),

                // ── Badge حصري (أعلى يمين) ─────────
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      badgeLabel,
                      style:  AppTextStyles.vipBadgeLabel
                    ),
                  ),
                ),

                // ── Badge VIP (أعلى يسار) ───────────
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.vipGold, AppColors.vipGoldDark],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.vipBicture,
                          width: 8,
                          height: 8,
                          color: AppColors.surface,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text('VIP', style: AppTextStyles.vipText),
                      ],
                    ),
                  ),
                ),

                // ── موقع (أسفل يسار) ────────────────
                if (locationName != null)
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (locationEmoji != null)
                          Text(locationEmoji!,
                              style: const TextStyle(fontSize: 12)),
                        const SizedBox(width: 4),
                        Text(
                          locationName!,
                          style: AppTextStyles.vipLocationName
                        ),
                      ],
                    ),
                  ),

                // ── صورة الطبيب (أسفل يمين) ─────────
                Positioned(
                  bottom: 0,
                  right: 12,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.vipGold,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(
                      doctorImagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── محتوى الكارد ─────────────────────────
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.vipGold,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    doctorLabel,
                    style: AppTextStyles.vipDoctorLabel 
                  ),
                ),
                SizedBox(
                  height: 4,
                ),

                Text(
                  doctorName,
                  style: AppTextStyles.label.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  specialty,
                  style: AppTextStyles.hint.copyWith(fontSize: 10),
                ),
                const SizedBox(height: 6),

                // ── تقييم ────────────────────────────
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        color: AppColors.textSecondary, size: 12),
                    const SizedBox(width: 4),
                    Text(
                      '$waitingMonths أشهر انتظار',
                      style: AppTextStyles.hint.copyWith(fontSize: 10),
                    ),
                    Spacer(),
                    Text(
                      rating.toString(),
                      style: AppTextStyles.hint.copyWith(fontSize: 10),
                    ),
                    const Icon(Icons.star, color: Colors.amber, size: 12),
                  ],
                ),
                const SizedBox(height: 6),
                Divider(
                  color: AppColors.hint,
                ),

                // ── سعر + زرار ───────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const VipBookButton(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'بدأ من',
                          style: AppTextStyles.hint.copyWith(fontSize: 8),
                        ),
                        Text(
                          price,
                          style: AppTextStyles.label.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w900,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
