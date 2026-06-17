import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class VipBookButton extends StatelessWidget {
  final VoidCallback? onTap;

  const VipBookButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 27,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [AppColors.vipGold, AppColors.vipGoldDark],
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('احجز', style: AppTextStyles.vipButton),
            SizedBox(width: 4),
            Text('VIP', style: AppTextStyles.vipButton),
          ],
        ),
      ),
    );
  }
}
