import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/build_icon.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';

class NotificationCard extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String subtitle;
  final Color? cardColor;

  const NotificationCard({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: SizeConfig.scaleHeight(2)),
      padding: SizeConfig.allPadding(4),
      decoration: BoxDecoration(
        color: cardColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(SizeConfig.scaleRadius(3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: SizeConfig.scaleWidth(1),
            offset: Offset(0, SizeConfig.scaleHeight(0.25)),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: SizeConfig.scalePadding(
          horizontal: 2,
          vertical: 0,
        ),
        leading: buildIcon(
          iconAsset,
          14,
          14,
        ),
        title: CustomText(
          title,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: SizeConfig.scaleHeight(0.3)),
          child: CustomText(
            subtitle,
            fontSize: 14,
            maxLines: 3,
            overflow: TextOverflow.visible,
          ),
        ),
      ),
    );
  }
}

