import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool showDivider;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(SizeConfig.scaleRadius(2)),
          child: Padding(
            padding: SizeConfig.scalePadding(horizontal: 4, vertical: 2),
            child: Row(
              children: [
                // Icon
                Container(
                  padding: SizeConfig.allPadding(2),
                  child: Icon(
                    icon,
                    size: SizeConfig.scaleWidth(6),
                    color: iconColor ?? AppColors.primary,
                  ),
                ),
                SizedBox(width: SizeConfig.scaleWidth(3)),
                // Title
                Expanded(
                  child: CustomText(
                    title,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                // Arrow
                Icon(
                  Icons.chevron_right,
                  size: SizeConfig.scaleWidth(6),
                  color: AppColors.grey400,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            thickness: 0.5,
            color: AppColors.grey200,
            indent: SizeConfig.scaleWidth(16),
          ),
      ],
    );
  }
}

