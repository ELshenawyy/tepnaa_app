import 'package:go_router/go_router.dart';
import 'package:login_screen/core/router/route_names.dart';
import 'package:login_screen/features/auth/presentation/views/login_view.dart';
import 'package:login_screen/features/auth/presentation/views/register_view.dart';
import 'package:login_screen/features/onBoarding/presentation/onBoarding/screens/onBoardingScreens.dart';
import 'package:login_screen/features/onBoarding/presentation/welcomeScreen/screens/select_language.dart';
import 'package:login_screen/features/onBoarding/presentation/welcomeScreen/screens/welcome_screen.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.splash,
  routes: [
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
      path: RouteNames.language,
      builder: (context, state) => LanguageScreen(),
    ),
    GoRoute(
      path: RouteNames.onBoarding,
      builder: (context, state) => OnboardingScreen(),
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
