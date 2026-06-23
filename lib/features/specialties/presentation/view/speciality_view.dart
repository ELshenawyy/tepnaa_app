import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/features/specialties/cubit/specialties_cubit.dart';
import 'package:login_screen/features/specialties/presentation/sections/all_specialtes_card.dart';
import 'package:login_screen/features/specialties/presentation/sections/before_and_after_section.dart';
import 'package:login_screen/features/specialties/presentation/sections/featured_specialties_section.dart';
import 'package:login_screen/features/specialties/presentation/sections/specialties_filter_section.dart';
import 'package:login_screen/features/specialties/presentation/sections/specialties_header_section.dart';

class SpecialtiesView extends StatelessWidget {
  const SpecialtiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SpecialtiesCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SpecialtiesHeaderSection(),
                const SpecialtiesFilterSection(),
                Divider(
                  color: AppColors.border,
                  thickness: 1,
                  height: 24,
                ),
                BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
                  builder: (context, state) {
                    final selectedFilter = state is SpecialtiesChanged
                        ? state.selectedFilter
                        : 'التخصصات';
                    switch (selectedFilter) {
                      case 'قبل وبعد':
                        return const BeforeAfterSection();
                      case 'الباقات':
                        return const SizedBox();
                      case 'المستشفى':
                        return const SizedBox();
                      default:
                        return const Column(
                          children: [
                            FeaturedSpecialtiesSection(),
                            SizedBox(height: 24),
                            AllSpecialtiesSection(),
                          ],
                        );
                    }
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
