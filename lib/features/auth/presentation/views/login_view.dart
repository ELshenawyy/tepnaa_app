import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/core/di/injection.dart';
import 'package:login_screen/core/localization/translation_keys.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/features/auth/presentation/sections/login_form_section.dart';
import 'package:login_screen/features/auth/presentation/sections/login_header_section.dart';
import 'package:login_screen/features/auth/presentation/sections/register_form_section.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_constants.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginCubit>(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.message,
                      style: const TextStyle(fontFamily: 'Inter'),
                    ),
                    backgroundColor: AppColors.error,
                  ),
                );
              }
              if (state is LoginSuccess) {
                // TODO: context.go(RouteNames.home)
              }
            },
            child: Column(
              children: [
                // ── Header + TabBar ───────────────
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const LoginHeaderSection(),
                    Positioned(
                      bottom: -30,
                      left: AppConstants.paddingH,
                      right: AppConstants.paddingH,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(
                            AppConstants.borderRadius,
                          ),
                        ),
                        child: TabBar(
                          indicator: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(
                              AppConstants.borderRadius - 2,
                            ),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          dividerColor: Colors.transparent,
                          labelStyle: AppTextStyles.tabLabelActive,
                          unselectedLabelStyle: AppTextStyles.tabLabelInactive,
                          labelColor: AppColors.surface,
                          unselectedLabelColor: AppColors.textSecondary,
                          tabs: [
                            Tab(text: TKeys.loginTitle.tr()),
                            Tab(text: TKeys.newRegister.tr()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24 + AppConstants.spacingLarge),

                // ── TabBarView ────────────────────
                const Expanded(
                  child: TabBarView(
                    children: [
                      LoginFormSection(),
                      RegisterFormSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
