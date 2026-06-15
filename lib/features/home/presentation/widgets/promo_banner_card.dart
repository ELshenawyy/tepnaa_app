import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/core/widgets/app_button.dart';

class PromoBannerCard extends StatelessWidget {
  const PromoBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        height: 210,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(AppImages.promoPanner),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x0008281E), // 0% شفاف
                Color(0x8C08281E), // 55%
                Color(0xEB08281E), // 92%
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Badge ───────────────────────────
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0x990D5A46),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0x800D7A5F), width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.local_fire_department,
                        color: Color(0xff34D399),
                        size: 14,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'الأكثر طلباً',
                        style: AppTextStyles.label.copyWith(
                          color: Color(0xff34D399),
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Title ────────────────────────────
              Text(
                'الاستشفاء الفاخر',
                style: AppTextStyles.heading.copyWith(
                  color: AppColors.surface,
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 4),

              // ── Description ─────────────────────
              Text(
                'تعافٍ شامل للجسم والروح',
                style: AppTextStyles.hint.copyWith(color: Colors.white70),
              ),
              const SizedBox(height: 4),

              // ── Location + Price ─────────────────
              Row(
                children: [
                  Text(
                    '\$1,200',
                    style: AppTextStyles.label.copyWith(
                      color: AppColors.priceGold,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Text('•',
                      style:
                          AppTextStyles.hint.copyWith(color: Colors.white54)),
                  const SizedBox(width: 8),
                  const Icon(Icons.location_on_outlined,
                      color: Colors.white54, size: 14),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      'إسطنبول، تركيا',
                      style: AppTextStyles.hint.copyWith(color: Colors.white54),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // ── Button ───────────────────────────
              AppButton(
                label: 'اكتشف الاستشفاء',
                icon: Icons.arrow_forward_rounded,
                width: 155,
                height: 41,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
