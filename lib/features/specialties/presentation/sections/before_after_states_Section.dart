import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class BeforeAfterStatsSection extends StatelessWidget {
  const BeforeAfterStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 72,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              AppColors.gradientStart,
              AppColors.primary,
            ],
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "نتائج حقيقية موثقة",
                    style: AppTextStyles.headerTitle.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text("أكثر من 2500 حالة ناجحة",
                      style: AppTextStyles.languageSubName.copyWith(
                        color: AppColors.tagBackground,
                      )),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.surface.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  Icons.picture_as_pdf_rounded,
                  color: AppColors.surface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
