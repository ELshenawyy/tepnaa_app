import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionLabel;
  final VoidCallback? onActionTap;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionLabel = 'عرض الكل',
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.heading.copyWith(fontSize: 15,fontWeight: FontWeight.w900),
        ),
        GestureDetector(
          onTap: onActionTap,
          child: Text(
            actionLabel,
            style: AppTextStyles.link.copyWith(fontSize: 12,fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}