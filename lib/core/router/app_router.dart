import 'package:go_router/go_router.dart';
import 'package:login_screen/core/router/route_names.dart';
import 'package:login_screen/features/auth/presentation/views/login_view.dart';
import 'package:login_screen/features/auth/presentation/views/register_view.dart';
import 'package:login_screen/features/home/presentation/views/home_view.dart';
import 'package:login_screen/features/intro/presentation/views/onboarding_view.dart';
import 'package:login_screen/features/intro/presentation/views/language_view.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.splash,
  routes: [
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: RouteNames.language,
      builder: (context, state) => LanguageView(),
    ),
    GoRoute(
      path: RouteNames.onBoarding,
      builder: (context, state) => OnboardingView(),
    ),
    GoRoute(
      path: RouteNames.login,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: RouteNames.register,
      builder: (context, state) => RegisterView(),
    ),
  ],
);
