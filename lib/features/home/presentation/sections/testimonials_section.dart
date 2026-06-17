import 'package:flutter/widgets.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/widgets/home_section_header.dart';
import 'package:login_screen/features/home/data/model/testimonial_data.dart';
import 'package:login_screen/features/home/presentation/widgets/testimonial_card.dart';

import '../../../../core/theme/app_constants.dart';

class HomeTestimonialsSection extends StatefulWidget {
  const HomeTestimonialsSection({super.key});

  @override
  State<HomeTestimonialsSection> createState() =>
      _HomeTestimonialsSectionState();
}

class _HomeTestimonialsSectionState extends State<HomeTestimonialsSection> {
  final List<TestimonialData> testimonials = [
    TestimonialData(
      image: AppImages.profilePic,
      name: 'نورة الشمري',
      country: 'السعودية',
      flag: '🇸🇦',
      program: 'برنامج التجديد الشامل 7 أيام',
      review:
          'تجربة غيّرت حياتي بالكامل. بعد سنوات من الإجهاد والضغط، قررت تجربة برنامج الاستشفاء في SHA. من اليوم الأول شعرت بالفرق — الهواء، الطعام، الجلسات، كل شيء مدروس بعناية. عدت للرياض',
      result: 'فقدت 4 كيلو وتحسن نومي',
      date: '2026/02/10',
      verified: true,
    ),
    TestimonialData(
      image: AppImages.travel,
      name: 'أحمد سلمان',
      country: 'مصر',
      flag: '🇸🇦',
      program: 'برنامج التجديد الشامل 7 أيام',
      review: 'تجربة غيرت حياتي بالكامل بعد سنوات من الإرهاق والضغط.',
      result: 'فقدت 4 كيلو وتحسن نومي',
      date: '2026/02/10',
      verified: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.paddingH,
          ),
          child: SizedBox(
            child: SectionHeader(
              title: 'تجارب حقيقية',
            ),
          ),
        ),
        SizedBox(height: AppConstants.spacing),
        SizedBox(
           height: 360,
          child: ListView.separated(
          padding: const EdgeInsets.all(12.0),
            // shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: testimonials.length,
            separatorBuilder: (_, __) => SizedBox(width: 12),
            itemBuilder: (_, index) {
              return TestimonialCard(
              
                testimonial: testimonials[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
