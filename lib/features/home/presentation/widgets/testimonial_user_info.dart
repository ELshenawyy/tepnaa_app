import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class TestimonialUserInfo extends StatelessWidget {
  final String image;
  final String name;
  final String country;
  final String flag;

  const TestimonialUserInfo({
    super.key,
    required this.image,
    required this.name,
    required this.country,
    required this.flag,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: (image.isNotEmpty) ? AssetImage(image) : null,
          child: image.isEmpty ? Icon(Icons.person) : null,
        ),
        const SizedBox(width: 12),
        
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    flag,
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    country,
                    style: AppTextStyles.hint,
                  ),
                ],
              ),
            ],
          ),
        
      ],
    );
  }
}
