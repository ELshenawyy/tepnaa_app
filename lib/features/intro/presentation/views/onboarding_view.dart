import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/core/localization/translation_keys.dart';
import 'package:login_screen/core/router/route_names.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/widgets/app_button.dart';
import 'package:login_screen/features/intro/presentation/widgets/onBoarding_page.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void _goToLogin() => context.go(RouteNames.login);

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
          isLast: false,
        ),
        _SlideData(
          imagePath: AppImages.travel,
          tag: TKeys.slide2Tag.tr(),
          title: TKeys.slide2Title.tr(),
          description: TKeys.slide2Desc.tr(),
          isLast: true,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final isLast = _currentIndex == _slides.length - 1;

    return Scaffold(
      body: Stack(
        children: [
          // ── PageView (الصور والمحتوى بس) ──────
          PageView.builder(
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
              );
            },
          ),

          // ── Dots + Skip (ثابتين فوق) ──────────
          Positioned(
            top: 48,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                

                // ── Skip ────────────────────────
                GestureDetector(
                  onTap: _goToLogin,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0x26FFFFFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      TKeys.skip.tr(),
                      style: AppTextStyles.skipButton,
                    ),
                  ),
                ),

                // ── Dots ────────────────────────
                Row(
                  children: List.generate(_slides.length, (i) {
                    final isActive = i == _currentIndex;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.only(right: 6),
                      width: isActive ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isActive ? AppColors.primary : Colors.white38,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),

          // ── زرار التالي/ابدأ (ثابت تحت) ──────
          Positioned(
            bottom: 32,
            left: 20,
            right: 20,
            child: AppButton(
              label: isLast ? TKeys.startNow.tr() : TKeys.next.tr(),
              icon: Icons.arrow_forward_outlined,
              onPressed: isLast ? _goToLogin : _nextPage,
            ),
          ),
        ],
      ),
    );
  }
}

class _SlideData {
  final String imagePath;
  final String tag;
  final String title;
  final String description;
  final bool isLast;

  const _SlideData({
    required this.imagePath,
    required this.tag,
    required this.title,
    required this.description,
    required this.isLast,
  });
}