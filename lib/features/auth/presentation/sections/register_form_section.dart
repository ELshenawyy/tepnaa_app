import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/core/localization/translation_keys.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/widgets/app_button.dart';
import 'package:login_screen/features/auth/presentation/widgets/custom_dropdown.dart';
import 'package:login_screen/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:login_screen/features/auth/presentation/widgets/file_upload_field.dart';
import 'package:login_screen/features/auth/presentation/widgets/phone_field.dart';
import 'package:login_screen/features/auth/presentation/widgets/terms_check_box.dart';

class RegisterFormSection extends StatefulWidget {
  const RegisterFormSection({super.key});

  @override
  State<RegisterFormSection> createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  String? _selectedCountry;
  String? _selectedCity;
  String? _selectedType;

  bool _acceptTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.paddingH,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // ── اسم المنشأة ───────────────────
            CustomTextField(
              label: TKeys.facilityName.tr(),
              hint: TKeys.facilityHint.tr(),
              controller: _nameController,
              prefexIcon: Icons.business_outlined,
            ),
            const SizedBox(height: AppConstants.spacing),

            // ── البريد الإلكتروني ─────────────
            CustomTextField(
              label: TKeys.email.tr(),
              hint: TKeys.emailHint.tr(),
              controller: _emailController,
              prefexIcon: Icons.email_outlined,
              isRequired: true,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return TKeys.emailRequired.tr();
                }
                if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return TKeys.emailInvalid.tr();
                }
                return null;
              },
            ),
            const SizedBox(height: AppConstants.spacing),

            // ── رقم الهاتف ────────────────────
            PhoneField(controller: _phoneController),
            const SizedBox(height: AppConstants.spacing),

            // ── الدولة + المدينة ──────────────
            Row(
              children: [
                // المدينة
                Expanded(
                  child: CustomDropdown(
                    label: TKeys.city.tr(),
                    hint: 'اختر المدينة',
                    items: const ['الرياض', 'جدة', 'مكة', 'المدينة'],
                    value: _selectedCity,
                    onChanged: (v) => setState(() => _selectedCity = v),
                  ),
                ),
                const SizedBox(width: 8),
                // الدولة
                Expanded(
                  child: CustomDropdown(
                    label: TKeys.country.tr(),
                    hint: 'السعودية',
                    items: const ['السعودية', 'الإمارات', 'مصر'],
                    value: _selectedCountry,
                    onChanged: (v) => setState(() => _selectedCountry = v),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.spacing),

            // ── نوع المنشأة ───────────────────
            CustomDropdown(
              label: TKeys.facilityType.tr(),
              hint: 'اختر نوع المنشأة',
              items: const ['مستشفى', 'عيادة', 'مركز طبي', 'صيدلية'],
              value: _selectedType,
              isRequired: true,
              onChanged: (v) => setState(() => _selectedType = v),
              validator: (v) => v == null ? 'يرجى اختيار نوع المنشأة' : null,
            ),
            const SizedBox(height: AppConstants.spacing),

            // ── الترخيص المهني ────────────────
            FileUploadField(
              label: TKeys.license.tr(),
              hint: 'اسحب ملف الترخيص المهني',
              subHint: 'PDF فقط، الحجم الأقصى 10 ميغابايت',
              isRequired: true,
            ),
            const SizedBox(height: AppConstants.spacing),

            // ── شهادات إضافية ─────────────────
            FileUploadField(
              label: TKeys.certificates.tr(),
              hint: 'اسحب ملف شهادات إضافية',
              subHint: 'اختياري',
            ),
            const SizedBox(height: AppConstants.spacing),

            // ── Checkbox ──────────────────────
            TermsCheckbox(
              value: _acceptTerms,
              onChanged: (v) => setState(() => _acceptTerms = v ?? false),
            ),
            const SizedBox(height: AppConstants.spacingLarge),

            // ── Submit Button ─────────────────
            AppButton(
                label: TKeys.submit.tr(),
                icon: Icons.arrow_back_rounded,
                onPressed: () {} // TODO
                ),
            const SizedBox(height: AppConstants.spacingLarge),
          ],
        ),
      ),
    );
  }
}
