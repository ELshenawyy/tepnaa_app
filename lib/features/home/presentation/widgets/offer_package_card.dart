import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/core/widgets/app_button.dart';
import '../sections/offer_package_section.dart';

class OfferPackageCard extends StatelessWidget {
  final OfferPackageData package;
  final VoidCallback? onTap;

  const OfferPackageCard({
    super.key,
    required this.package,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── صورة + badges ─────────────────────
          SizedBox(
            height: 160,
            child: Stack(
              children: [
                // ── صورة ──────────────────────────
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.asset(
                    package.imagePath,
                    width: double.infinity,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),

                // ── Top badges row ─────────────────
                Positioned(
                  top: 8,
                  left: 8,
                  right: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ── badge "قبل" ───────────────
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.error,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:
                            const Text('قبل', style: AppTextStyles.vipButton),
                      ),

                      // ── badge "الأكثر طلباً" ──────
                      if (package.isMostRequested)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.iconBackground,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'الأكثر طلباً',
                            style: AppTextStyles.vipButton.copyWith(
                              color: AppColors.extraPrimaryLight,
                            ),
                          ),
                        )
                      else
                        const SizedBox(),
                    ],
                  ),
                ),

                // ── زرار "عرض بعد" (وسط) ──────────
                Positioned(
                  bottom: 8,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.sync, color: AppColors.primary, size: 14),
                          SizedBox(width: 6),
                          Text(
                            'عرض بعد',
                            style: AppTextStyles.vipButton.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── المحتوى ──────────────────────────
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── اسم الباقة ───────────────────
                Text(
                  package.name,
                  style: AppTextStyles.label.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),

                // ── الموقع ───────────────────────
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                        color: AppColors.textSecondary, size: 12),
                    const SizedBox(width: 4),
                    Text(
                      package.location,
                      style: AppTextStyles.hint.copyWith(fontSize: 11),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // ── الميزة ───────────────────────
                Container(
                  width: 200,
                  height: 35,
                  decoration: BoxDecoration(
                    color: AppColors.iconBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle_outline,
                            color: AppColors.primary, size: 12),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            package.feature,
                            style: AppTextStyles.vipButton.copyWith(
                              color: AppColors.primary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4),

                // ── نجوم + موقع العلم ────────────
                Row(
                  children: [
                    ...List.generate(
                      5,
                      (i) => Icon(
                        Icons.star,
                        color: i < package.rating.floor()
                            ? Colors.amber
                            : Colors.grey.shade300,
                        size: 12,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Spacer(),
                    Text(
                      package.location.split('،').last.trim(),
                      style: AppTextStyles.hint.copyWith(fontSize: 11),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      package.locationEmoji,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 4),
                    Text('•', style: AppTextStyles.hint.copyWith(fontSize: 11)),
                    const SizedBox(width: 6),
                    Text('س.م',
                        style: AppTextStyles.hint.copyWith(fontSize: 11)),
                  ],
                ),
                const SizedBox(height: 8),

                // ── زراين ────────────────────────
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        label: 'التفاصيل',
                        icon: Icons.info_outline,
                        type: AppButtonType.outlined,
                        height: 34,
                        iconPosition: IconPosition.start,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppButton(
                        label: 'احجز',
                        icon: Icons.calendar_today_outlined,
                        height: 34,
                        iconPosition: IconPosition.start,
                        onPressed: onTap,
                      ),
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
