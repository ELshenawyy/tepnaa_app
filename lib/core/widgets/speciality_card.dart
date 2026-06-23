import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class SpecialityCard extends StatelessWidget {
  final String imagePath;
  final IconData icon;
  final String titleAr;
  final String titleEn;
  final String centersCount;
  final bool isHighlighted;
  final VoidCallback? onTap;

  const SpecialityCard({
    super.key,
    required this.imagePath,
    required this.icon,
    required this.titleAr,
    required this.titleEn,
    required this.centersCount,
    this.isHighlighted = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            border: isHighlighted
                ? Border.all(color: AppColors.primary, width: 3)
                : null,
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x000A140F),
                  Color(0x8C0A140F),
                ],
                stops: [0.3, 1.0],
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: Colors.white, size: 16),
                    ),
                    Text(
                      titleAr,
                      style: AppTextStyles.label.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      centersCount,
                      style: AppTextStyles.hint.copyWith(
                        color: Colors.white70,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      titleEn,
                      style: AppTextStyles.hint.copyWith(
                        color: Colors.white70,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
