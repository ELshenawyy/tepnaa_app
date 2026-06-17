import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class VipBanner extends StatelessWidget {
  const VipBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [AppColors.vipBannerDark, AppColors.vipBannerMid],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        border: Border.all(
          color: const Color(0x4DC8A96E),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 1,
                color: AppColors.vipGoldDark,
              ),
              color: AppColors.vipBannerMid
            ),
            child: Image.asset(
              AppImages.vipBicture,
              width: 18,
              height: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'خدمة حصرية لا تجدها في أي مكان آخر',
                  style: AppTextStyles.label.copyWith(
                    color: AppColors.surface,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'أطباء المشاهير متاحون فقط عبر طبنا VIP',
                  style: AppTextStyles.hint.copyWith(
                    color: Colors.white60,
                    fontSize: 10,
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
