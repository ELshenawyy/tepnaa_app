import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/core/localization/translation_keys.dart';
import 'package:login_screen/core/router/route_names.dart';
import 'package:login_screen/core/theme/app_constants.dart';
import 'package:login_screen/core/theme/app_images.dart';
import 'package:login_screen/core/theme/app_text_style.dart';
import 'package:login_screen/features/home/presentation/widgets/home_search_bar.dart';
import '../widgets/notification_icon.dart';
import '../widgets/user_avatar.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingH,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                AppImages.tibnaLogo,
                height: AppConstants.bannerHeight,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              const UserAvatar(),
              const SizedBox(width: 8),
              const NotificationIcon(count: 3),
            ],
          ),
          const SizedBox(height: AppConstants.spacingLarge),
          Text(
            '👋 ${TKeys.welcomeUser.tr(args: ['أحمد'])}',
            style: AppTextStyles.subheading,
          ),
          const SizedBox(height: 4),
          Text(
            TKeys.whereIsYourJourney.tr(),
            style: AppTextStyles.heading
                .copyWith(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: AppConstants.spacingLarge),
          GestureDetector(
            onTap: () => context.go(RouteNames.search),
            child: AbsorbPointer(
              child: HomeSearchBar(),
            ),
          ),
        ],
      ),
    );
  }
}
