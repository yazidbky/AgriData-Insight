import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/constants/app_assets.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/build_icon.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';

enum TaskType {
  warning,
  irrigation,
  fertilizer,
}

class DailyTaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final TaskType taskType;
  final VoidCallback? onTap;

  const DailyTaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.taskType,
    this.onTap,
  });

  Color get _backgroundColor {
    switch (taskType) {
      case TaskType.warning:
        return const Color(0xFFFFE5E5); // Light red/pink
      case TaskType.irrigation:
        return const Color(0xFFE3F2FD); // Light blue
      case TaskType.fertilizer:
        return const Color(0xFFE8F5E9); // Light green
    }
  }

  Color get _borderColor {
    switch (taskType) {
      case TaskType.warning:
        return const Color(0xFFFFCDD2); // Soft red border
      case TaskType.irrigation:
        return const Color(0xFFBBDEFB); // Soft blue border
      case TaskType.fertilizer:
        return const Color(0xFFC8E6C9); // Soft green border
    }
  }

  String get _iconAsset {
    switch (taskType) {
      case TaskType.warning:
        return AppAssets.stop;
      case TaskType.irrigation:
        return AppAssets.waterDrop;
      case TaskType.fertilizer:
        return AppAssets.bigLeaf;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: SizeConfig.scaleHeight(1.5)),
        padding: SizeConfig.scalePadding(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(SizeConfig.scaleRadius(4)),
          border: Border.all(
            color: _borderColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              padding: SizeConfig.allPadding(2),
              child: buildIcon(
                _iconAsset,
                8,
                8,
              ),
            ),
            SizedBox(width: SizeConfig.scaleWidth(3)),
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    title,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(0.3)),
                  CustomText(
                    subtitle,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey600,
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

