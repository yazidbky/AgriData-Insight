import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';

class StatusCard extends StatelessWidget {
  final Color cardColor;
  final Widget icon;
  final String title;
  final String status;
  final Color statusColor;
  final double? width;
  final double? height;

  const StatusCard({
    super.key,
    required this.cardColor,
    required this.icon,
    required this.title,
    required this.status,
    required this.statusColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: width,
      height: height ?? SizeConfig.scaleHeight(15),
      padding: SizeConfig.allPadding(4),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(SizeConfig.scaleRadius(3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          icon,
          const Spacer(),
          CustomText(
            title,
            fontSize: 14,
            color: AppColors.grey600,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: SizeConfig.scaleHeight(0.5)),
          CustomText(
            status,
            fontSize: 20,
            color: statusColor,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}

