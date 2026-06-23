import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/core/widgets/app_filter_chip.dart';
import 'package:login_screen/features/specialties/cubit/specialties_cubit.dart';
import 'package:login_screen/features/specialties/data/models/specialty_filter_model.dart';

class SpecialtiesFilterSection extends StatelessWidget {
  const SpecialtiesFilterSection({
    super.key,
  });

  static const filters = [
    SpecialtyFilterModel(
      label: 'التخصصات',
      icon: Icons.grid_view,
    ),
    SpecialtyFilterModel(
      label: 'قبل وبعد',
      icon: Icons.favorite_border,
    ),
    SpecialtyFilterModel(
      label: 'الباقات',
      icon: Icons.wallet,
    ),
    SpecialtyFilterModel(
      label: 'المستشفى',
      icon: Icons.local_hospital_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        final cubit = context.read<SpecialtiesCubit>();

        return SizedBox(
          height: 40,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (_, index) {
              final filter = filters[index];

              return AppFilterChip(
                label: filter.label,
                icon: filter.icon,
                isActive: state is SpecialtiesChanged
                    ? state.selectedFilter == filter.label
                    : filter.label == 'التخصصات',
                onTap: () {
                  cubit.changeFilter(
                    filter.label,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
