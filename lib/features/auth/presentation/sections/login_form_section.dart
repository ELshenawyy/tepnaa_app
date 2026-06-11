import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/core/localization/translation_keys.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/features/auth/presentation/cubit/login_cubit.dart';
import 'package:login_screen/features/auth/presentation/cubit/login_state.dart';
import 'package:login_screen/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:login_screen/features/auth/presentation/widgets/password_field.dart';

class LoginFormSection extends StatefulWidget {
  final VoidCallback onRegisterTap;

  const LoginFormSection({super.key, required this.onRegisterTap});

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
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  TKeys.loginSubtitle.tr(),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
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
                    child: Text(
                      TKeys.forgotPassword.tr(),
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppConstants.spacingLarge),

                // ── Login Button ──────────────────
                SizedBox(
                  width: double.infinity,
                  height: AppConstants.buttonHeight,
                  child: ElevatedButton.icon(
                    onPressed: isLoading ? null : _submit,
                    icon: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                    label: Text(
                      TKeys.loginTitle.tr(),
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.borderRadius,
                        ),
                      ),
                    ),
                  ),
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
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: AppColors.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: AppColors.border),
                    ),
                  ],
                ),
                const SizedBox(height: AppConstants.spacing),

                // ── Register Button ───────────────
                SizedBox(
                  width: double.infinity,
                  height: AppConstants.buttonHeight,
                  child: OutlinedButton.icon(
                    onPressed: widget.onRegisterTap,
                    icon: const Icon(Icons.person_add_outlined,
                        color: AppColors.primary, size: 20),
                    label: Text(
                      TKeys.registerButton.tr(),
                      style: AppTextStyles.button.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.surface,
                      side: const BorderSide(
                        color: AppColors.secondaryBorder,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppConstants.borderRadius),
                      ),
                      minimumSize:
                          const Size(double.infinity, AppConstants.fieldHeight),
                    ),
                  ),
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
