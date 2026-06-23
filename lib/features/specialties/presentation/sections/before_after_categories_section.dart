import 'package:flutter/material.dart';
import 'package:login_screen/core/widgets/app_filter_chip.dart';
import 'package:login_screen/features/specialties/data/models/specialty_filter_model.dart';

class BeforeAfterCategoriesSection extends StatefulWidget {
  const BeforeAfterCategoriesSection({super.key});

  @override
  State<BeforeAfterCategoriesSection>
      createState() =>
          _BeforeAfterCategoriesSectionState();
}

class _BeforeAfterCategoriesSectionState
    extends State<BeforeAfterCategoriesSection> {

  String selected = "الكل";

static const List<SpecialtyFilterModel> filters =  [
  SpecialtyFilterModel(label: 'الكل', icon: Icons.grid_view),
  SpecialtyFilterModel(label: 'الأسنان', icon: Icons.medical_services_outlined),
  SpecialtyFilterModel(label: 'التجميل', icon: Icons.auto_awesome_outlined),
  SpecialtyFilterModel(label: 'الشعر', icon: Icons.content_cut_outlined),
];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: double.infinity,
      child: ListView.separated(
        padding:
            const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) =>
            const SizedBox(width: 8),
        itemBuilder: (_, index) {
          return AppFilterChip(
            label: filters[index].label,
        icon: filters[index].icon,
            isActive:
                selected == filters[index].label,
            onTap: () {
              setState(() {
                selected = filters[index].label;
              });
            },
          );
        },
      ),
    );
  }
}