import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/core/widgets/hospital_card.dart';
import 'package:login_screen/core/theme/app_images.dart';

class SearchTabsSection extends StatelessWidget {
  final int hospitalsCount;
  final int packagesCount;

  const SearchTabsSection({
    super.key,
    required this.hospitalsCount,
    required this.packagesCount,
  });

  // ── Dummy Data ────────────────────────────
  static const List<Map<String, dynamic>> _dummyHospitals = [
    {
      'nameAr': 'مركز شارلوتنبورغ للتأهيل',
      'location': 'برلين، ألمانيا',
      'rating': 5.0,
      'reviewsCount': 654,
      'packagesCount': 1,
      'badges': ['التأهيل الطبي'],
      'imagePath': AppImages.hospital,
      'price': '\$12,000',
      'showPrice': true,
      'showCheckmark': true,
    },
    {
      'nameAr': 'مركز نوفا للتأهيل الطبي',
      'location': 'إسطنبول، تركيا',
      'rating': 4.9,
      'reviewsCount': 1432,
      'packagesCount': 3,
      'badges': ['التأهيل الطبي'],
      'imagePath': AppImages.hospital,
      'price': '\$15,000',
      'showPrice': true,
      'showCheckmark': true,
    },
    {
      'nameAr': 'مستشفى ميدبارك للتأهيل',
      'location': 'بانكوك، تايلاند',
      'rating': 4.8,
      'reviewsCount': 987,
      'packagesCount': 2,
      'badges': ['التأهيل الطبي'],
      'imagePath': AppImages.hospital,
      'price': '\$10,000',
      'showPrice': true,
      'showCheckmark': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── TabBar ──────────────────────────
          Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              border: Border.all(color: AppColors.border),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TabBar(
                indicator: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(
                    AppConstants.borderRadius - 2,
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: AppColors.surface,
                labelStyle: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                ),
                unselectedLabelStyle: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                ),
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.local_hospital_outlined, size: 11),
                        const SizedBox(width: 2),

                        const Text('العيادات والمستشفيات'),
                        const SizedBox(width: 4),
                        // ── Circle Count ──────────────
                        Builder(
                          builder: (context) {
                            final isActive =
                                DefaultTabController.of(context).index == 0;
                            return Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? Colors.white24
                                    : AppColors.iconBackground,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '$hospitalsCount',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: isActive
                                        ? AppColors.surface
                                        : AppColors.primary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.card_giftcard_outlined, size: 11),
                        const SizedBox(width: 4),
                        const Text('الباقات والبرامج'),
                        const SizedBox(width: 4),
                        Builder(
                          builder: (context) {
                            final isActive =
                                DefaultTabController.of(context).index == 1;
                            return Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? Colors.white24
                                    : AppColors.iconBackground,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '$packagesCount',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: isActive
                                        ? AppColors.surface
                                        : AppColors.primary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: AppConstants.spacing),

          // ── TabBarView ──────────────────────
          Expanded(
            child: Container(
              color: AppColors.background,
              child: TabBarView(
                children: [
                  // ── Tab 1: المستشفيات ──────────
                  ListView.separated(
                    itemCount: _dummyHospitals.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, i) {
                      final h = _dummyHospitals[i];
                      return HospitalCard(
                        imagePath: h['imagePath'],
                        nameAr: h['nameAr'],
                        location: h['location'],
                        rating: h['rating'],
                        reviewsCount: h['reviewsCount'],
                        packagesCount: h['packagesCount'],
                        badges: List<String>.from(h['badges']),
                        showPrice: h['showPrice'],
                        price: h['price'],
                        showCheckmark: h['showCheckmark'],
                      );
                    },
                  ),

                  // ── Tab 2: الباقات (placeholder) ─
                  Center(
                    child: Text(
                      'قريباً',
                      style: AppTextStyles.subheading,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
