import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class HospitalCard extends StatelessWidget {
  final String imagePath;
  final String nameAr;

  final String location;
  final double rating;
  final int reviewsCount;
  final int packagesCount;
  final List<String> badges;
  final VoidCallback? onTap;
  final bool showPrice;
  final String? price;
  final bool showCheckmark;

  const HospitalCard({
    super.key,
    required this.imagePath,
    required this.nameAr,
    required this.location,
    required this.rating,
    required this.reviewsCount,
    required this.packagesCount,
    required this.badges,
    this.onTap,
    this.showPrice = false,
    this.price,
    this.showCheckmark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          // ── صورة المستشفى ─────────────────────
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                width: 72,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),
            if (showCheckmark)
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
          ]),
          SizedBox(
            width: 8,
          ),

          // ── المحتوى ───────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Badges ────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 4,
                      children:
                          badges.map((badge) => _Badge(label: badge)).toList(),
                    ),
                  ],
                ),

                // ── الاسم ─────────────────────────
                Text(
                  maxLines: 1,
                  nameAr,
                  style: AppTextStyles.label.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                  ),
                ),

                // ── الموقع ───────────────────────
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: AppColors.textSecondary,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: AppTextStyles.hint.copyWith(fontSize: 11),
                    ),
                  ],
                ),

                // ── تقييم + باقات ─────────────────
                Row(
                  children: [
                    Text(
                      '$packagesCount باقة',
                      style: AppTextStyles.hint.copyWith(fontSize: 11),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '($reviewsCount)',
                      style: AppTextStyles.hint.copyWith(fontSize: 11),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$rating',
                      style: AppTextStyles.fieldLabel
                          .copyWith(fontSize: 11, fontWeight: FontWeight.w700),
                    ),
                    const Icon(Icons.star, color: AppColors.vipGold, size: 12),
                  ],
                ),
                SizedBox(height: 4),
                if (showPrice && price != null)
                  Text(
                    'بدأ من $price',
                    style: AppTextStyles.label.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // ── زرار السهم ───────────────────────
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.iconBackground,
                borderRadius: BorderRadiusDirectional.circular(10),
              ),
              child: const Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.primary,
                size: 14,
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}

// ── Badge Widget ──────────────────────────────
class _Badge extends StatelessWidget {
  final String label;

  const _Badge({required this.label});

  Color get _backgroundColor {
    switch (label) {
      case 'ISPA':
        return AppColors.iconBackground;
      case 'JCI':
      case 'ISO':
      case 'ISAPS':
        return const Color(0xFFF0EDE8);
      default:
        return AppColors.iconBackground;
    }
  }

  Color get _textColor {
    switch (label) {
      case 'ISPA':
        return AppColors.primary;
      case 'JCI':
      case 'ISO':
      case 'ISAPS':
        return AppColors.vipGold;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 9,
          fontWeight: FontWeight.w700,
          color: _textColor,
        ),
      ),
    );
  }
}
