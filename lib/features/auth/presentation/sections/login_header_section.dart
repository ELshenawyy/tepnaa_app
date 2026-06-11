import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/features/auth/presentation/widgets/auth_tab_bar.dart';
import 'package:login_screen/features/auth/presentation/widgets/login_header.dart';

class LoginHeaderSection extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onLoginTap;
  final VoidCallback onRegisterTap;

  const LoginHeaderSection({
    super.key,
    required this.onLoginTap,
    required this.onRegisterTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const LoginHeader(),
        Positioned(
          bottom: -25,
          left: AppConstants.paddingH,
          right: AppConstants.paddingH,
          child: AuthTabBar(
            activeTab: currentIndex == 0 ? AuthTab.login : AuthTab.register,
            onLoginTap: onLoginTap,
            onRegisterTap: onRegisterTap,
          ),
        ),
      ],
    );
  }
}
