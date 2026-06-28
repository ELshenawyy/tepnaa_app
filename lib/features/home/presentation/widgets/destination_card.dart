import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/features/home/data/model/destination_item_model.dart';
import 'package:login_screen/features/home/presentation/widgets/explore_button.dart';


class DestinationCard extends StatelessWidget {
  final String imagePath;
  final String flagEmoji;
  final String countryName;
  final String hospitalsCount;
  final String? badgeText;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final String? description;
  final bool showButton;
  final FlagPosition? flagPosition;
  final VoidCallback? onTap;
  final bool? showIcon;
  final double? titleFontSize;

  const DestinationCard({
    super.key,
    required this.imagePath,
    required this.flagEmoji,
    required this.countryName,
    required this.hospitalsCount,
    this.badgeText,
    this.badgeColor,
    this.badgeTextColor,
    this.description,
    this.showButton = false,
    this.flagPosition = FlagPosition.bottomLeft,
    this.onTap,
    this.showIcon = false,
    this.titleFontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // ── 1. صورة ──────────────────────────
            Image.asset(imagePath, fit: BoxFit.cover),

            // ── 2. Gradient ───────────────────────
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x000A140F), Color(0xCC0A140F)],
                  stops: [0.3, 1.0],
                ),
              ),
            ),

            // ── 3. Badge (أعلى يمين) ─────────────
            if (badgeText != null)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor ?? AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    badgeText!,
                    style: AppTextStyles.hint.copyWith(
                      color: badgeTextColor ?? AppColors.textPrimary,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

            // ── 4. Flag (أعلى شمال - تركيا) ──────
            if (flagPosition == FlagPosition.topLeft)
              Positioned(
                top: 10,
                left: 10,
                child: Text(flagEmoji, style: const TextStyle(fontSize: 18)),
              ),

            // ── 5. المحتوى أسفل ──────────────────
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          countryName,
                          style: AppTextStyles.heading.copyWith(
                            color: AppColors.surface,
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      if (flagPosition == FlagPosition.bottomLeft)
                        Text(
                          flagEmoji,
                          style: const TextStyle(fontSize: 18),
                        ),
                    ],
                  ),
                  if (description != null) ...[
                    Text(
                      description!,
                      style: AppTextStyles.hint.copyWith(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (showButton) ...[
                        ExploreButton(label: 'إستكشف'),
                        Spacer()
                      ],
                      const SizedBox(width: 4),
                      if (showIcon == true)
                        Icon(
                          Icons.local_hospital_rounded,
                          size: 10,
                          color: Colors.white70,
                        ),
                      Flexible(
                        child: Text(
                          hospitalsCount,
                          style: AppTextStyles.hint.copyWith(
                            color: Colors.white70,
                            fontSize: 8,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
