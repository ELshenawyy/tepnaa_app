import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class TestimonialFooter extends StatelessWidget {
  final String date;
  final bool verified;

  const TestimonialFooter({
    super.key,
    required this.date,
    required this.verified,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (verified) ...[
          const Icon(
            Icons.verified,
            size: 16,
            color: AppColors.primary,
          ),
          const SizedBox(width: 4),
          Text(
            'موثق',
            style: AppTextStyles.label.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],

        const Spacer(),

        Text(
          date,
          style: AppTextStyles.hint,
        ),
      ],
    );
  }
}