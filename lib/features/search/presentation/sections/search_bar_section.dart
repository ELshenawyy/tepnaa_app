import 'package:flutter/material.dart';
import 'package:login_screen/features/search/presentation/widgets/search_input_bar.dart';

class SearchBarSection extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onFilterTap;
  final ValueChanged<String> onChanged;

  const SearchBarSection({
    super.key,
    required this.controller,
    required this.onFilterTap,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SearchInputBar(
      controller: controller,
      onChanged: onChanged,
      onFilterTap: onFilterTap,
    );
  }
}
