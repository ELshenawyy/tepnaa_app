import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:login_screen/features/auth/presentation/sections/login_form_section.dart';
import 'package:login_screen/features/auth/presentation/sections/login_header_section.dart';
import 'package:login_screen/features/auth/presentation/views/register_view.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_constants.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  int _currentIndex = 0;
  final _pageController = PageController();

  void _goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: TextStyle(
                    fontFamily: 'Inter',
                  ),
                ),
                backgroundColor: AppColors.error,
              ),
            );
          }
          if (state is LoginSuccess) {
            // TODO: navigate to home
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              LoginHeaderSection(
                  onLoginTap: () => _goToPage(0),
                  onRegisterTap: () => _goToPage(1),
                  currentIndex: _currentIndex),
              const SizedBox(
                height: 24 + AppConstants.spacingLarge,
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (i) => setState(
                    () {
                      _currentIndex = i;
                    },
                  ),
                  children: [
                    LoginFormSection(onRegisterTap: () => _goToPage(1)),
                    const RegisterView(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
