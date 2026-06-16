import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/features/home/presentation/sections/banner_section.dart';
import 'package:login_screen/features/home/presentation/sections/destinations_section.dart';
import 'package:login_screen/features/home/presentation/sections/header_section.dart';
import 'package:login_screen/features/home/presentation/sections/home_categories_section.dart';
import 'package:login_screen/features/home/presentation/sections/specialties_section.dart';
import 'package:login_screen/features/home/presentation/sections/stats_card_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HomeHeaderSection(),
              const SizedBox(height: AppConstants.spacingLarge),
              const HomeBannerSection(),
              const SizedBox(height: AppConstants.spacingLarge),
              const HomeStatsSection(),
              const SizedBox(height: AppConstants.spacingLarge),
              const HomeCategoriesSection(),
              const SizedBox(height: AppConstants.spacingLarge),
              const HomeSpecialtiesSection(),
              const SizedBox(height: AppConstants.spacingLarge),
              const HomeDestinationsSection(),
              const SizedBox(height: AppConstants.spacingLarge),
            ],
          ),
        ),
      ),
    );
  }
}
