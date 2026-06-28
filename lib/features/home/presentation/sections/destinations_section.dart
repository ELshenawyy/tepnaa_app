import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/widgets/home_section_header.dart';
import 'package:login_screen/features/home/presentation/widgets/speciality_tag.dart';
import '../../../../core/di/injection.dart';
import '../../data/model/destination_item_model.dart';
import '../cubit/distination_cubit.dart';
import '../widgets/destination_card.dart';

class HomeDestinationsSection extends StatelessWidget {
  const HomeDestinationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildCard(DestinationItemModel distnation) {
      return DestinationCard(
        imagePath: distnation.imagePath,
        flagEmoji: distnation.flagEmoji,
        countryName: distnation.countryName,
        hospitalsCount: distnation.hospitalsCount,
        badgeText: distnation.badgeText,
        badgeColor: distnation.badgeColor,
        badgeTextColor: distnation.badgeTextColor,
        description: distnation.description,
        showButton: distnation.showButton,
        flagPosition: distnation.flagPosition,
        titleFontSize: distnation.titleFontSize,
        showIcon: distnation.showIcon,
      );
    }

    return BlocProvider(
      create: (_) => sl<DistinationCubit>()..getSpecialties(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingH),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(title: 'الوجهات الأكثر طلباً'),
            const SizedBox(height: AppConstants.spacing),
            SizedBox(
              height: 48,
              child: BlocBuilder<DistinationCubit, DistinationState>(
                builder: (context, state) {
                  if (state is DistinationLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is DistinationSuccess) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 8,
                        children: state.specialties.map((specialty) {
                          return SpecialtyTag(
                            icon: specialty.chipIcon,
                            label: specialty.chipLabel,
                            iconColor: specialty.chipIconColor,
                            isActive: specialty.key == state.selectKey,
                            onTap: () => context
                                .read<DistinationCubit>()
                                .selectSpicialty(specialty.key),
                          );
                        }).toList(),
                      ),
                    );
                  }
                  if (state is DistinationFailure) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return Container();
                },
              ),
            ),
            const SizedBox(height: AppConstants.spacing),
            BlocBuilder<DistinationCubit, DistinationState>(
              builder: (context, state) {
                if (state is DistinationLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is DistinationSuccess) {
                  final selected = state.specialties
                      .firstWhere((s) => s.key == state.selectKey);

                  final destinations = selected.destinations;

                  return Column(
                    children: [
                      SizedBox(
                        height: 190,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: buildCard(destinations[0]),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: buildCard(destinations[1]),
                                  ),
                                  const SizedBox(height: 8),
                                  Expanded(
                                    child: buildCard(destinations[2]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 90,
                        child: Row(
                          children: [
                            Expanded(
                              child: buildCard(destinations[3]),
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: buildCard(destinations[4])),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
