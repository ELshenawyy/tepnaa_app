import 'package:flutter/material.dart';
import 'package:login_screen/core/theme/app_colors.dart';
import 'package:login_screen/core/theme/app_images.dart';

class UserAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;

  const UserAvatar({
    super.key,
    this.imageUrl,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: 1.5),
      ),
      child: ClipOval(
        child: imageUrl != null
            ? Image.network(imageUrl!, fit: BoxFit.cover)
            : Container(
                color: AppColors.iconBackground,
                child: Image.asset(
                  AppImages.profilePic,
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
