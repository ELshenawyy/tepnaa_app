import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/core/localization/translation_keys.dart';
import 'package:login_screen/core/router/route_names.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/features/onBoarding/presentation/onBoarding/widgets/onBoardingPage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void _goToLogin() {
    context.go(RouteNames.login);
  }

  void _nextPage() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _slides => [
        {
          'imagePath': AppImages.hospital,
          'tag': TKeys.slide1Tag.tr(),
          'title': TKeys.slide1Title.tr(),
          'description': TKeys.slide1Desc.tr(),
          'buttonText': TKeys.next.tr(),
          'isLast': false,
        },
        {
          'imagePath': AppImages.tibnaLogo,
          'tag': TKeys.slide2Tag.tr(),
          'title': TKeys.slide2Title.tr(),
          'description': TKeys.slide2Desc.tr(),
          'buttonText': TKeys.startNow.tr(),
          'isLast': true,
        },
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (i) => setState(() => _currentIndex = i),
        itemCount: _slides.length,
        itemBuilder: (_, i) {
          final slide = _slides[i];
          return OnboardingPage(
            imagePath: slide['imagePath'],
            tag: slide['tag'],
            title: slide['title'],
            description: slide['description'],
            buttonText: slide['buttonText'],
            currentIndex: _currentIndex,
            total: _slides.length,
            onButtonTap: slide['isLast'] ? _goToLogin : _nextPage,
            onSkip: _goToLogin,
          );
        },
      ),
    );
  }
}