import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/core/router/route_names.dart';
import 'package:login_screen/features/app_shell/presentation/shell_view.dart';
import 'package:login_screen/features/auth/presentation/views/login_view.dart';
import 'package:login_screen/features/auth/presentation/views/register_view.dart';
import 'package:login_screen/features/home/presentation/views/home_view.dart';
import 'package:login_screen/features/intro/presentation/views/onboarding_view.dart';
import 'package:login_screen/features/intro/presentation/views/language_view.dart';
import 'package:login_screen/features/intro/presentation/views/welcome_view.dart';
import 'package:login_screen/features/search/presentation/views/search_view.dart';
import 'package:login_screen/features/specialties/presentation/view/speciality_view.dart';

final appRouter = GoRouter(
initialLocation: RouteNames.splash,
  routes: [
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) => const WelcomeView(),
    ),
    GoRoute(
      path: RouteNames.language,
      builder: (context, state) => const LanguageView(),
    ),
    GoRoute(
      path: RouteNames.onBoarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: RouteNames.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: RouteNames.register,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: RouteNames.search,
      builder: (context, state) => const SearchView(),
    ),
    ShellRoute(
      builder: (context, state, child) => ShellView(child: child),
      routes: [
        GoRoute(
          path: RouteNames.home,
          builder: (_, __) => const HomeView(),
        ),
        GoRoute(
          path: RouteNames.specialties,
          builder: (_, __) => const SpecialtiesView(),
        ),
        GoRoute(
          path: RouteNames.orders,
          builder: (_, __) => const SizedBox(),
        ),
        GoRoute(
          path: RouteNames.favorites,
          builder: (_, __) => const SizedBox(),
        ),
        GoRoute(
          path: RouteNames.profile,
          builder: (_, __) => const SizedBox(),
        ),
      ],
    ),
  ],
);
