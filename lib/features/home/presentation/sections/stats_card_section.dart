import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import '../widgets/quick_stat_card.dart';

class HomeStatsSection extends StatelessWidget {
  const HomeStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingH),
      child: Row(
        children: const [
          Expanded(
            child: QuickStatCard(
              icon: Icons.local_hospital_outlined,
              value: '1,5+',
              label: 'مستشفى',
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: QuickStatCard(
              icon: Icons.public,
              value: '30',
              label: 'دولة',
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: QuickStatCard(
              icon: Icons.headset_mic_outlined,
              value: '24/7',
              label: 'دعم عربي',
            ),
          ),
        ],
      ),
    );
  }
}
