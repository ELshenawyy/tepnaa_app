import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const List<_NavItem> _items = [
    _NavItem(
        label: 'الرئيسية',
        icon: Icons.home_outlined,
        activeIcon: Icons.home_rounded),
    _NavItem(
        label: 'التخصصات',
        icon: Icons.grid_view_outlined,
        activeIcon: Icons.grid_view_rounded),
    _NavItem(
        label: 'طلباتي',
        icon: Icons.receipt_long_outlined,
        activeIcon: Icons.receipt_long_rounded),
    _NavItem(
        label: 'المفضلة',
        icon: Icons.favorite_outline,
        activeIcon: Icons.favorite_rounded),
    _NavItem(
        label: 'حسابي',
        icon: Icons.person_outline_rounded,
        activeIcon: Icons.person_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        selectedLabelStyle: AppTextStyles.selectedLabelStyle,
        unselectedLabelStyle: AppTextStyles.unSelectedLabelStyle,
        items: _items
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                        width: 24,
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Icon(item.activeIcon),
                  ],
                ),
                label: item.label,
              ),
            )
            .toList());
  }
}

class _NavItem {
  final String label;
  final IconData icon;
  final IconData activeIcon;

  const _NavItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });
}
