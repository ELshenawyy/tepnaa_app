import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class TermsCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const TermsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: const BorderSide(color: AppColors.border),
        ),
        RichText(
          textDirection: TextDirection.rtl,
          text: TextSpan(
            style: TextStyle(fontFamily: 'Inter',
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
            children: [
              const TextSpan(text: 'أوافق على '),
              TextSpan(
                text: 'شروط الاستخدام',
                style: TextStyle(fontFamily: 'Inter',
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
              const TextSpan(text: ' و '),
              TextSpan(
                text: 'سياسة الخصوصية',
                style: TextStyle(fontFamily: 'Inter',
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      
      ],
    );
  }
}