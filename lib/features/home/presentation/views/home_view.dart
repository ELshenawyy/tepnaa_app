import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/features/home/presentation/sections/banner_section.dart';
import 'package:login_screen/features/home/presentation/sections/destinations_section.dart';
import 'package:login_screen/features/home/presentation/sections/header_section.dart';
import 'package:login_screen/features/home/presentation/sections/home_categories_section.dart';
import 'package:login_screen/features/home/presentation/sections/hospital_section.dart';
import 'package:login_screen/features/home/presentation/sections/package_section.dart';
import 'package:login_screen/features/home/presentation/sections/stats_card_section.dart';
import 'package:login_screen/features/home/presentation/sections/testimonials_section.dart';
import 'package:login_screen/features/home/presentation/sections/vip_doctor_section.dart';
import 'package:login_screen/features/home/presentation/sections/why_tebna_section.dart';

import '../sections/offer_package_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: AppConstants.paddingV,
            children: [
              const HomeHeaderSection(),
              const HomeBannerSection(),
              const HomeStatsSection(),
              const HomeCategoriesSection(),
              const HomeDestinationsSection(),
              const HomeVipDoctorsSection(),
              const HomeHospitalsSection(),
              const HomePackagesSection(),
              const OfferPackagesSection(),
              const HomeTestimonialsSection(),
              const WhyTebnaaSection(),
              const SizedBox(height: AppConstants.paddingV),
            ],
          ),
        ),
      ),
    );
  }
}
