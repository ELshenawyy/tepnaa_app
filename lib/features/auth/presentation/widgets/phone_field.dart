import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/core/localization/translation_keys.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_constants.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TKeys.phone.tr(), style: AppTextStyles.fieldLabel),
        const SizedBox(height: 6),
        Row(
          children: [
            // ── رقم الهاتف ────────────────────────
            Expanded(
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'Inter',
                  fontSize: 14,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: '5XXXXXXXX',
                  hintStyle: AppTextStyles.hint,
                  suffixIcon: const Icon(
                    Icons.phone_android_outlined,
                    color: AppColors.hint,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingH,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadius),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadius),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadius),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 1.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadius),
                    borderSide: const BorderSide(color: AppColors.error),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadius),
                    borderSide:
                        const BorderSide(color: AppColors.error, width: 1.5),
                  ),
                  errorStyle: AppTextStyles.errorText.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return TKeys.phoneRequired.tr();
                  }
                  if (value.length < 9) return TKeys.phoneInvalid.tr();
                  return null;
                },
              ),
            ),
            const SizedBox(width: 8),

            // ── Country Code ──────────────────────
            Container(
              height: AppConstants.fieldHeight,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.keyboard_arrow_down_rounded,
                      color: AppColors.hint, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    '+966',
                    style: TextStyle(fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text('🇸🇦', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
