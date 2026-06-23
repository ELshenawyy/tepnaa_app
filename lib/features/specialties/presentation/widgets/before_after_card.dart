import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/core/widgets/app_button.dart';

class BeforeAfterCard extends StatelessWidget {
  const BeforeAfterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          // ── صورة + badges ─────────────────────
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                // ── صورة واحدة ──────────────────
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  child: Image.asset(
                    AppImages.hospital,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),

                // ── badge "الأكثر طلباً" ─────────
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'الأكثر طلباً',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 12,
                  right: 12,
                  child: Row(



                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBorder,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'قبل',
                        style: TextStyle(
                          color: AppColors.surface,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                      decoration: BoxDecoration(
                        color: AppColors.textSecondary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'بعد',
                        style: TextStyle(
                          color: AppColors.surface,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
              ],),
                ),

               
              ],
            ),
          ),

          // ── المحتوى ──────────────────────────
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── اسم العملية ─────────────────
                Text(
                  'نحت الجسم الشامل - VASER 360°',
                  style: AppTextStyles.label.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),

                

                // ── موقع ─────────────────────────
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 12,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Row(
                      children: [
                        Text(
                          'إسطنبول، تركيا • 🇹🇷',
                          style: AppTextStyles.hint.copyWith(fontSize: 11),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                  children: List.generate(
                    5,
                    (_) => const Icon(
                      Icons.star,
                      color: AppColors.vipGold,
                      size: 14,
                    ),
                  ),
                ),
                  ],
                ),
                const SizedBox(height: 8),

                // ── تقييم ────────────────────────
                
                const SizedBox(height: 12),

                // ── زراين ────────────────────────
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        label: 'احجز نفس العملية',
                        height: 36,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppButton(
                        label: 'التفاصيل',
                        height: 36,
                        type: AppButtonType.outlined,
                        onPressed: () {},
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