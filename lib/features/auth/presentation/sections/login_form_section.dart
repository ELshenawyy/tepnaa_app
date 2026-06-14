import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/core/localization/translation_keys.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_icons.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/core/utils/app_validator.dart';
import 'package:login_screen/core/widgets/app_button.dart';
import 'package:login_screen/features/auth/presentation/cubit/login_cubit.dart';
import 'package:login_screen/features/auth/presentation/cubit/login_state.dart';
import 'package:login_screen/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:login_screen/features/auth/presentation/widgets/password_field.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<LoginCubit>().submit(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final isLoading = state is LoginLoading;

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingH,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // ── Avatar ────────────────────────
                Container(
                  width: AppConstants.avatarSize,
                  height: AppConstants.avatarSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.person_outline_rounded,
                    size: 34,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: AppConstants.spacing),

                // ── Title ─────────────────────────
                Text(
                  TKeys.loginTitle.tr(),
                  style: AppTextStyles.loginTitle
                      .copyWith(color: AppColors.textPrimary),
                ),
                const SizedBox(height: 4),
                Text(
                  TKeys.loginSubtitle.tr(),
                  style: AppTextStyles.subheading,
                ),
                const SizedBox(height: AppConstants.spacingLarge),

                // ── Email ─────────────────────────
                CustomTextField(
                  label: TKeys.email.tr(),
                  hint: TKeys.emailHint.tr(),
                  controller: _emailController,
                  prefexIcon: Icons.email_outlined,
                  isRequired: true,
                  keyboardType: TextInputType.emailAddress,
                  validator: AppValidators.email,
                ),
                const SizedBox(height: AppConstants.spacing),

                // ── Password ──────────────────────
                PasswordField(controller: _passwordController),
                const SizedBox(height: AppConstants.spacingSmall),

                // ── Forgot password ───────────────
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(TKeys.forgotPassword.tr(),
                        style: AppTextStyles.link.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ),
                const SizedBox(height: AppConstants.spacingLarge),

                // ── Login Button ──────────────────
                isLoading
                    ? const SizedBox(
                        width: double.infinity,
                        height: AppConstants.buttonHeight,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : AppButton(
                        label: TKeys.loginTitle.tr(),
                        icon: Icons.arrow_forward_outlined,
                        onPressed: _submit,
                      ),

                const SizedBox(height: AppConstants.spacing),

                // ── Divider ───────────────────────
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: AppColors.border),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.spacingSmall,
                      ),
                      child: Text(
                        TKeys.or.tr(),
                        style: AppTextStyles.subheading,
                      ),
                    ),
                    Expanded(
                      child: Divider(color: AppColors.border),
                    ),
                  ],
                ),
                const SizedBox(height: AppConstants.spacing),

                // ── Register Button ───────────────
                AppButton(
                  label: TKeys.newRegister.tr(),
                  type: AppButtonType.outlined,
                  svgAssetPath: AppIcons.registerIcon,
                  iconPosition: IconPosition.start,
                  onPressed: () {
                    DefaultTabController.of(context).animateTo(1);
                  },
                ),
                const SizedBox(height: AppConstants.spacingLarge),
              ],
            ),
          ),
        );
      },
    );
  }
}
