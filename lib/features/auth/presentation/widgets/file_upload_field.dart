import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_constants.dart';

class FileUploadField extends StatelessWidget {
  final String label;
  final String hint;
  final String subHint;
  final bool isRequired;
  final bool hasError;

  const FileUploadField({
    super.key,
    required this.label,
    required this.hint,
    this.subHint = '',
    this.isRequired = false,
    this.hasError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Label ────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(label, style: AppTextStyles.fieldLabel),
            if (isRequired)
              Text(
                ' *',
                style: TextStyle(fontFamily: 'Inter',
                  color: AppColors.error,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
          ],
        ),
        if (subHint.isNotEmpty) ...[
          const SizedBox(height: 2),
          Text(subHint, style: AppTextStyles.hint.copyWith(fontSize: 11)),
        ],
        const SizedBox(height: 6),

        // ── Upload Box ───────────────────────────
        GestureDetector(
          onTap: () {}, // TODO: file picker
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              border: Border.all(
                color: hasError ? AppColors.error : AppColors.border,
                width: hasError ? 1.5 : 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  color: hasError ? AppColors.error : AppColors.hint,
                  size: 28,
                ),
                const SizedBox(height: 6),
                Text(
                  hint,
                  style: AppTextStyles.hint.copyWith(
                    color: hasError ? AppColors.error : AppColors.hint,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
