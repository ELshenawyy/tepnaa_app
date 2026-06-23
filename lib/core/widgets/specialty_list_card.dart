import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_text_style.dart';

class SpecialtyListCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String centersCount;
  final String imagePath;

  final IconData leadingIcon;
  final Color? leadingColor;

  final VoidCallback? onTap;

  const SpecialtyListCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.centersCount,
    required this.imagePath,
    required this.leadingIcon,
    this.leadingColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.secondaryBorder,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                width: 72,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: AppConstants.spacing),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                       Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: (leadingColor ?? AppColors.primary).withOpacity(.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  leadingIcon,
                  size: 12,
                  color: leadingColor ?? AppColors.primary,
                ),
              ),
                      Text(
                        title,
                      
                        style: AppTextStyles.label.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    subtitle,
                    style: AppTextStyles.hint,
                  ),
                  Container(
                    decoration : BoxDecoration(
                      color: AppColors.iconBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      centersCount,
                      style: AppTextStyles.hint.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ( AppColors.primary).withOpacity(.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  size: 18,
                  color:  AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
