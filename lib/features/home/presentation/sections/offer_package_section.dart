import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/core/widgets/home_section_header.dart';
import '../widgets/offer_package_card.dart';

enum OfferPackageCategory { bodyContouring, aesthetic, hairTransplant }

class OfferPackageData {
  final String name;
  final String hospitalName;
  final String price;
  final String? discount;
  final String location;
  final String mostOrdered;
  final String feature;
  final String locationEmoji;
  final double rating;
  final bool isMostRequested;
  final OfferPackageCategory category;
  final String imagePath;

  String get categoryLabel {
    switch (category) {
      case OfferPackageCategory.bodyContouring:
        return 'نحت الجسم';
      case OfferPackageCategory.aesthetic:
        return 'التجميل';
      case OfferPackageCategory.hairTransplant:
        return 'زراعة الشعر';
    }
  }

  const OfferPackageData(
      {required this.name,
      required this.hospitalName,
      required this.price,
      this.discount,
      required this.location,
      required this.feature,
      required this.locationEmoji,
      required this.rating,
      required this.isMostRequested,
      required this.category,
      required this.imagePath,
      required this.mostOrdered});
}

class OfferPackagesSection extends StatefulWidget {
  const OfferPackagesSection({super.key});

  @override
  State<OfferPackagesSection> createState() => _OfferPackagesSectionState();
}

class _OfferPackagesSectionState extends State<OfferPackagesSection> {
  OfferPackageCategory _selectedCategory = OfferPackageCategory.bodyContouring;

  final List<_FilterTab> _tabs = const [
    _FilterTab(
        label: 'نحت الجسم', category: OfferPackageCategory.bodyContouring),
    _FilterTab(label: 'التجميل', category: OfferPackageCategory.aesthetic),
    _FilterTab(
        label: 'زراعة الشعر', category: OfferPackageCategory.hairTransplant),
  ];

  final List<OfferPackageData> _allPackages = const [
    // ── نحت الجسم ────────────────────────
    OfferPackageData(
      name: 'نحت الجسم الشامل - VASER 360°',
      hospitalName: 'SHA Wellness Clinic',
      price: '\$1,200',
      discount: '-33%',
      location: 'إسطنبول، تركيا',
      feature: 'فقدان 12 سم من الخصر',
      locationEmoji: '🇹🇷',
      rating: 5,
      isMostRequested: true,
      category: OfferPackageCategory.bodyContouring,
      imagePath: AppImages.hospital,
      mostOrdered: 'الأكثر طلبا',
    ),
    OfferPackageData(
        name: 'شد البطن الكامل - Tuck',
        hospitalName: 'Bumrungrad Body',
        price: '\$2,800',
        discount: '-33%',
        location: 'بانكوك، تايلاند',
        feature: 'إزالة 800 جرام من الجلد',
        locationEmoji: '🇹🇭',
        rating: 5,
        isMostRequested: false,
        category: OfferPackageCategory.bodyContouring,
        imagePath: AppImages.hospital,
        mostOrdered: 'الأكثر طلبا'),

    // ── التجميل ──────────────────────────
    OfferPackageData(
        name: 'تجميل الأنف الدقيق',
        hospitalName: 'Estetik International',
        price: '\$3,500',
        discount: '-20%',
        location: 'إسطنبول، تركيا',
        feature: 'نتائج طبيعية 100%',
        locationEmoji: '🇹🇷',
        rating: 4.9,
        isMostRequested: true,
        category: OfferPackageCategory.aesthetic,
        imagePath: AppImages.hospital,
        mostOrdered: 'الأكثر طلبا'),
    OfferPackageData(
        name: 'رفع الوجه الكامل',
        hospitalName: 'SHA Wellness Clinic',
        price: '\$5,200',
        discount: '-15%',
        location: 'دبي، الإمارات',
        feature: 'تصغير 10 سنوات',
        locationEmoji: '🇦🇪',
        rating: 4.8,
        isMostRequested: false,
        category: OfferPackageCategory.aesthetic,
        imagePath: AppImages.hospital,
        mostOrdered: 'الأكثر طلبا'),

    // ── زراعة الشعر ──────────────────────
    OfferPackageData(
        name: 'زراعة شعر DHI المتقدمة',
        hospitalName: 'Anantara Healing',
        price: '\$2,100',
        discount: '-25%',
        location: 'إسطنبول، تركيا',
        feature: 'زراعة 4000 بصيلة',
        locationEmoji: '🇹🇷',
        rating: 5,
        isMostRequested: true,
        category: OfferPackageCategory.hairTransplant,
        imagePath: AppImages.hospital,
        mostOrdered: 'الأكثر طلبا'),
    OfferPackageData(
        name: 'زراعة شعر FUE الكلاسيكية',
        hospitalName: 'Bumrungrad Body',
        price: '\$1,800',
        discount: '-10%',
        location: 'بانكوك، تايلاند',
        feature: 'زراعة 3000 بصيلة',
        locationEmoji: '🇹🇭',
        rating: 4.8,
        isMostRequested: false,
        category: OfferPackageCategory.hairTransplant,
        imagePath: AppImages.hospital,
        mostOrdered: 'الأكثر طلبا'),
  ];

  List<OfferPackageData> get _filteredPackages =>
      _allPackages.where((p) => p.category == _selectedCategory).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header ─────────────────────────────
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConstants.paddingH),
          child: const SectionHeader(title: 'قبل وبعد'),
        ),
        const SizedBox(height: AppConstants.spacing),

        // ── Filter Tabs ────────────────────────
        SizedBox(
          height: 36,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding:
                const EdgeInsets.symmetric(horizontal: AppConstants.paddingH),
            itemCount: _tabs.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (_, i) {
              final tab = _tabs[i];
              final isActive = tab.category == _selectedCategory;
              return GestureDetector(
                onTap: () => setState(() => _selectedCategory = tab.category),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary : AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isActive
                          ? AppColors.primary
                          : AppColors.secondaryBorder,
                    ),
                  ),
                  child: Text(
                    tab.label,
                    style: AppTextStyles.label.copyWith(
                      fontSize: 13,
                      color: isActive ? Colors.white : AppColors.textPrimary,
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: AppConstants.spacing),

        // ── Cards ──────────────────────────────
        SizedBox(
          height: 330,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding:
                const EdgeInsets.symmetric(horizontal: AppConstants.paddingH),
            itemCount: _filteredPackages.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, i) =>
                OfferPackageCard(package: _filteredPackages[i]),
          ),
        ),
        const SizedBox(height: 8),

        // ── Alert ──────────────────────────────
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConstants.paddingH),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.secondaryBorder,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.vipGold)),
            child: Row(
              children: [
                const Icon(Icons.info_outline,
                    color: AppColors.vipGold, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'الصور موثقة طبياً بموافقة المريض. النتائج تختلف من شخص لآخر حسب الحالة الصحية.',
                    style: AppTextStyles.hint.copyWith(fontSize: 8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FilterTab {
  final String label;
  final OfferPackageCategory category;
  const _FilterTab({required this.label, required this.category});
}
