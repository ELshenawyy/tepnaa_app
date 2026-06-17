import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';

class WhyTebnaaCard extends StatelessWidget {
  final Widget banner;
  final List<Widget> items;

  const WhyTebnaaCard({
    super.key,
    required this.banner,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        children: [
          banner,

          const SizedBox(height: 12),

          ...items,

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}