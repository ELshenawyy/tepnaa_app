import 'package:flutter/material.dart';
import '../widgets/before_after_card.dart';

class BeforeAfterResultsSection extends StatelessWidget {
  const BeforeAfterResultsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(),
      itemCount: 6,
      separatorBuilder: (_, __) =>
          const SizedBox(height: 16),
      itemBuilder: (_, index) {
        return const BeforeAfterCard();
      },
    );
  }
}