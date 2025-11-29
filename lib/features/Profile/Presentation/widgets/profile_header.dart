import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Profile/Presentation/widgets/profile_avatar.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  final String location;
  final String? imageUrl;
  final VoidCallback? onEditProfilePicture;

  const ProfileHeader({
    super.key,
    required this.userName,
    required this.location,
    this.imageUrl,
    this.onEditProfilePicture,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Column(
      children: [
        SizedBox(height: SizeConfig.scaleHeight(4)),
        // Profile avatar with badge
        ProfileAvatar(
          imageUrl: imageUrl,
          size: 30,
          onEditTap: onEditProfilePicture,
          showBadge: true,
        ),
        SizedBox(height: SizeConfig.scaleHeight(2)),
        // User name
        CustomText(
          userName,
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        SizedBox(height: SizeConfig.scaleHeight(0.5)),
        // Location
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: SizeConfig.scaleWidth(5),
              color: AppColors.primary,
            ),
            SizedBox(width: SizeConfig.scaleWidth(1)),
            CustomText(
              location,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey600,
            ),
          ],
        ),
      ],
    );
  }
}

