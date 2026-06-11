import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_constants.dart';
import '../../../../core/theme/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData? prefexIcon;
  final bool isRequired;
  final TextInputType keyboardType;
  final TextDirection textDirection;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.prefexIcon,
    this.isRequired = false,
    this.keyboardType = TextInputType.text,
    this.textDirection = TextDirection.rtl,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // ── Label ────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           
            Text(label, style: AppTextStyles.fieldLabel),
             if (isRequired)
              Text(' *', style: TextStyle(fontFamily: 'Inter',
                color: AppColors.error,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              )),
          ],
        ),
        const SizedBox(height: 6),

        // ── Field ─────────────────────────────────
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textDirection: textDirection,
          textAlign: TextAlign.right,
          style: TextStyle(fontFamily: 'Inter',
            fontSize: 14,
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.hint,
            prefixIcon: prefexIcon != null
                ? Icon(prefexIcon, color: AppColors.hint, size: 20)
                : null,
            filled: true,
            fillColor: AppColors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingH,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              borderSide: const BorderSide(color: AppColors.error, width: 1.5),
            ),
            errorStyle: AppTextStyles.errorText.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}