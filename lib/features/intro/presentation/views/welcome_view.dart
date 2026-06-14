import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/core/di/injection.dart';
import 'package:login_screen/core/localization/translation_keys.dart';
import 'package:login_screen/core/router/route_names.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/features/intro/presentation/cubit/splash_cubit.dart';
import 'package:login_screen/features/intro/presentation/cubit/splash_state.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SplashCubit>()..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToLanguage) {
            context.go(RouteNames.language);
          } else if (state is SplashNavigateToLogin) {
            context.go(RouteNames.login);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.surface,
          body: Column(
            children: [
              const Spacer(),

              // ── Logo ──────────────────────────────
              Center(
                child: Image.asset(
                  AppImages.tibnaLogo,
                  height: AppConstants.wElcomelogoHeight,
                  width: AppConstants.welcomelogoWeight,
                  fit: BoxFit.contain,
                ),
              ),

              const Spacer(),

              // ── النصوص في المنتصف ─────────────────
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      TKeys.welcomeTagline.tr(),
                      style: AppTextStyles.tagline,
                    ),
                    const SizedBox(height: 4),

                    // ── الخط الأخضر ───────────────────
                    Container(
                      width: 118,
                      height: 2,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 12),

                    Text(TKeys.loading.tr(), style: AppTextStyles.loading),
                  ],
                ),
              ),
              const SizedBox(height: 78),
            ],
          ),
        ),
      ),
    );
  }
}
