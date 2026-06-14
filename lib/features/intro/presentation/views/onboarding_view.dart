import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/core/localization/translation_keys.dart';
import 'package:login_screen/core/router/route_names.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/features/intro/presentation/widgets/onBoarding_page.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
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

  List<_SlideData> get _slides => [
        _SlideData(
          imagePath: AppImages.hospital,
          tag: TKeys.slide1Tag.tr(),
          title: TKeys.slide1Title.tr(),
          description: TKeys.slide1Desc.tr(),
          buttonText: TKeys.next.tr(),
          isLast: false,
        ),
        _SlideData(
          imagePath: AppImages.travel,
          tag: TKeys.slide2Tag.tr(),
          title: TKeys.slide2Title.tr(),
          description: TKeys.slide2Desc.tr(),
          buttonText: TKeys.startNow.tr(),
          isLast: true,
        ),
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
            imagePath: slide.imagePath,
            tag: slide.tag,
            title: slide.title,
            description: slide.description,
            buttonText: slide.buttonText,
            currentIndex: _currentIndex,
            total: _slides.length,
            onButtonTap: slide.isLast ? _goToLogin : _nextPage,
            onSkip: _goToLogin,
          );
        },
      ),
    );
  }
}

class _SlideData {
  final String imagePath;
  final String tag;
  final String title;
  final String description;
  final String buttonText;
  final bool isLast;

  const _SlideData({
    required this.imagePath,
    required this.tag,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.isLast,
  });
}