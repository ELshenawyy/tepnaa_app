import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/features/home/data/model/testimonial_data.dart';
import 'package:login_screen/features/home/presentation/widgets/testimonial_footer.dart';
import 'package:login_screen/features/home/presentation/widgets/testimonial_result_badge.dart';
import 'package:login_screen/features/home/presentation/widgets/testimonial_user_info.dart';

class TestimonialCard extends StatelessWidget {
  final TestimonialData testimonial;

  const TestimonialCard({
    super.key,
    required this.testimonial,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TestimonialUserInfo(
                image: testimonial.image,
                name: testimonial.name,
                country: testimonial.country,
                flag: testimonial.flag,
              ),
              Spacer(),
              Row(
                children: List.generate(
                  5,
                  (_) => const Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Icon(
                      Icons.star,
                      color: AppColors.priceGold,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: AppColors.iconBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              testimonial.program,
              style: AppTextStyles.vipButton.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            testimonial.review,
            style: AppTextStyles.label,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          TestimonialResultBadge(
            result: testimonial.result,
          ),
          const SizedBox(height: 16),
          TestimonialFooter(
            date: testimonial.date,
            verified: testimonial.verified,
          ),
        ],
      ),
    );
  }
}
